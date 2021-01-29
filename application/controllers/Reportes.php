<?php
defined('BASEPATH') or exit('No direct script access allowed');
 
class Reportes extends MY_Controller{
    function __construct()
    {
        parent::__construct();
        $this->require_min_level(9);        
    } 

    function index(){  
        $this->getReporte();
    }

    function getReporte(){

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
        }
        if ($fechaInicial != 0 and $fechaFinal == 0) {
            $data['fecha'] = $fechaInicial;
            $data['productos'] = $this->getReporteFecha($fechaInicial);
            
        }
        if ($fechaInicial != 0 and $fechaFinal != 0) {
            $data['fecha'] = $fechaInicial." al ".$fechaFinal;
            $data['productos'] = $this->getReporteRango($fechaInicial,$fechaFinal);

        }
        $data['_view'] = 'reportes/index';
        //$data['pagina_activa'] = "venta,productos,reportes"
        $data['pagina_activa'] = "reportes";
        $this->load->view('layouts/main',$data);
        
    }

    private function getReporteHoy(){
        $this->load->model('Reportes_model');
        date_default_timezone_set('America/Mexico_City');
        $Hoy = date('d-m-Y');
        return $this->Reportes_model->reportToday($Hoy);        
    }
    private function getReporteFecha($fecha){
        $this->load->model('Reportes_model');
        return $this->Reportes_model->reportFecha($fecha);
    }
    private function getReporteRango($fechaInicial,$fechaFinal){
        $this->load->model('Reportes_model');
        return $this->Reportes_model->reportRango($fechaInicial,$fechaFinal);
    }

    
}