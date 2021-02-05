<?php
defined('BASEPATH') or exit('No direct script access allowed');
 
class PuntoDeVenta extends MY_Controller{
    function __construct()
    {
        parent::__construct();
        $this->require_min_level(1);        
        $this->load->model('Producto_model');
        $this->load->model('Entrada_efectivo_caja_model');
            date_default_timezone_set('America/Mexico_City');
            $now = date('Y-m-d');
            $data['entrada'] = $this->Entrada_efectivo_caja_model->getCaja($now);
            if (!$data['entrada']) {
                redirect('caja');
            }
    } 


    function index(){  
        if( $this->is_role('admin') or $this->is_role('empleado') ){     
            $data['pagina_activa'] = "venta";
            $data['productos'] = $this->Producto_model->get_productos_disponibles();
            $data['_view'] = 'point_of_sale/index';
            $this->load->view('layouts/main',$data);
        }else{
            redirect('venta');
        }
    }

    /**
     * CHECA MINIMO STOCK
     */
    public function check_min_stock(){
        $this->load->model('Producto_model');
        $data['alerta_stock'] = $this->Producto_model->get_minimo_stock_productos();
        $abastecer = array();
        $cant = 0;
        foreach ($data['alerta_stock'] as $key) {
            if ($key['abastecer'] == "true") {
                $cant++;
                array_push($abastecer,$key);                
            }               
        }
        $response = array(
            'items' => $abastecer ,
            'cantidad' => $cant 
        );
        return $response;        
        //echo json_encode($response);
    }


    
}