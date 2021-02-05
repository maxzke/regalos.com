<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/*
*   REST_Controller EXTIENDE DE MY_Controller
*   AHORA POSEE LOS METODOS DE COMUNITY AUTH
*   Y METODOS PROPIOS REST
*/
require_once(APPPATH.'libraries/REST_Controller.php');
use Restserver\libraries\REST_Controller;
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
/**
 * PRINT TICKET POS
 */
require __DIR__ . '../autoload.php';
use Mike42\Escpos\Printer;
use Mike42\Escpos\EscposImage;
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;


class Historial_ventas extends REST_Controller {

    function __construct(){        
        parent::__construct();
        $this->load->model('Historial_ventas_model');        
        $this->require_min_level(1);
    }

    public function index_get(){
        $data['pagina_activa'] = "historial_ventas";        
        $data['ventas'] = $this->Historial_ventas_model->get_all();
        $data['_view'] = 'historial/index';
        $this->load->view('layouts/main',$data);
        //echo json_encode($data);
    }












}//end class