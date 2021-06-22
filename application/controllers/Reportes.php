<?php
defined('BASEPATH') or exit('No direct script access allowed');
 
class Reportes extends MY_Controller{
    function __construct()
    {
        parent::__construct();
        
        $this->require_min_level(1);  
        $this->load->model('Reportes_model');
        if( !$this->is_role('admin') ){
            redirect('restringido');
        }      
    } 

    function index(){  
        $this->load->library('session');
        $this->session->set_userdata('empleado', 'DAVID');
        $this->getReporte();
    }

    function getReporte(){
        $this->load->model('User_model');
        $data['usuarios'] = $this->User_model->get_all_users();
        $usuariosArray = [];
        $fechaInicial = $this->input->get('desde');
        $fechaFinal = $this->input->get('hasta');

        if ($fechaInicial != 0) {
            $fechaInicial = date("d-m-Y", strtotime($fechaInicial));
        }
        if ($fechaFinal != 0) {
            $fechaFinal = date("d-m-Y", strtotime($fechaFinal));
        }
                
        if ($fechaInicial == 0 and $fechaFinal == 0) {
            date_default_timezone_set('America/Mexico_City');
            $Hoy = date('d-m-Y');
            $data['fecha'] = $Hoy;
            $data['productos'] = $this->getReporteHoy();

            
            foreach ($data['usuarios'] as $item) {
                $nombreUsuario = $item['username'];
                $productosUsuario = $this->getReporteHoy($item['username']);
            
                $msg = array(
                    'nombre' => $nombreUsuario,
                    'productos' => $productosUsuario
                );
                array_push($usuariosArray,$msg);
            }

        }
        if ($fechaInicial != 0 and $fechaFinal == 0) {
            $data['fecha'] = $fechaInicial;
            $data['productos'] = $this->getReporteFecha($fechaInicial);      
            
            foreach ($data['usuarios'] as $item) {
                $nombreUsuario = $item['username'];
                $productosUsuario = $this->getReporteFecha($fechaInicial,$item['username']);
            
                $msg = array(
                    'nombre' => $nombreUsuario,
                    'productos' => $productosUsuario
                );
                array_push($usuariosArray,$msg);
            }
        }
        if ($fechaInicial != 0 and $fechaFinal != 0) {
            $data['fecha'] = $fechaInicial." al ".$fechaFinal;
            $data['productos'] = $this->getReporteRango($fechaInicial,$fechaFinal);

            foreach ($data['usuarios'] as $item) {
                $nombreUsuario = $item['username'];
                $productosUsuario = $this->getReporteRango($fechaInicial,$fechaFinal,$item['username']);
            
                $msg = array(
                    'nombre' => $nombreUsuario,
                    'productos' => $productosUsuario
                );
                array_push($usuariosArray,$msg);
            }

        }
        $data['info'] = $usuariosArray;
        $data['_view'] = 'reportes/index';
        //$data['pagina_activa'] = "venta,productos,reportes"
        $data['pagina_activa'] = "reportes";
        $this->load->view('layouts/main',$data);
        
    }

    private function getReporteHoy($usuario=null){
        if ($usuario) {
            date_default_timezone_set('America/Mexico_City');
            $Hoy = date('d-m-Y');
            return $this->Reportes_model->reportToday_usuario($Hoy,$usuario);
        }else{
            date_default_timezone_set('America/Mexico_City');
            $Hoy = date('d-m-Y');
            return $this->Reportes_model->reportToday($Hoy);        
        }
    }
    private function getReporteFecha($fecha,$usuario=null){
        if ($usuario) {
            return $this->Reportes_model->reportFecha_usuario($fecha,$usuario);
        }else{
        return $this->Reportes_model->reportFecha($fecha);
        }
        
    }
    private function getReporteRango($fechaInicial,$fechaFinal,$usuario=null){
        if ($usuario) {
            return $this->Reportes_model->reportRango_usuario($fechaInicial,$fechaFinal,$usuario);
        }else{
            return $this->Reportes_model->reportRango($fechaInicial,$fechaFinal);
        }
    }

    
}