<?php
defined('BASEPATH') or exit('No direct script access allowed');
 
class Caja extends MY_Controller{
    function __construct()
    {
        parent::__construct();
        $this->require_min_level(1);
    }



  /**
     * CARGA VISTA SALDO CAJA INICIAL
     */
    function index(){
        $data['pagina_activa'] = "";
        $data['_view'] = 'caja/index';
        $this->load->view('layouts/main',$data);
    }

    function get_today(){
        $this->load->model('Entrada_efectivo_caja_model');
        date_default_timezone_set('America/Mexico_City');
        $now = date('Y-m-d');
        $data['entrada'] = $this->Entrada_efectivo_caja_model->getCaja($now);
        
        if ($data['entrada']) {
            $response = $data['entrada']['importe'];
        }else{
            $response = 0;
        }

        echo json_encode($response);

    }

    /*
     * Adding a new entrada_efectivo_caja
     */
    function add()
    {   
        $this->load->library('form_validation');

		$this->form_validation->set_rules('efectivo','Efectivo','numeric|required');
		
		if($this->form_validation->run())     
        {   
            date_default_timezone_set('America/Mexico_City');
            $now = date('d-m-Y H:i:s');

            $params = array(
				'importe' => $this->input->post('efectivo'),
				'usuario' => $this->auth_username,
            );
            
            $entrada_efectivo_caja_id = $this->Entrada_efectivo_caja_model->add_entrada_efectivo_caja($params);
            redirect('venta');
        }
        else
        {            
            redirect('venta');
        }
    }  

    /*
     * Editing a entrada_efectivo_caja
     */
    function edit($id)
    {   
        // check if the entrada_efectivo_caja exists before trying to edit it
        $data['entrada_efectivo_caja'] = $this->Entrada_efectivo_caja_model->get_entrada_efectivo_caja($id);
        
        if(isset($data['entrada_efectivo_caja']['id']))
        {
            $this->load->library('form_validation');

			$this->form_validation->set_rules('efectivo','Efectivo','numeric|required');
		
			if($this->form_validation->run())     
            {   
                $params = array(
					'efectivo' => $this->input->post('efectivo'),
					'fecha' => $this->input->post('fecha'),
					'usuario' => $this->input->post('usuario'),
                );

                $this->Entrada_efectivo_caja_model->update_entrada_efectivo_caja($id,$params);            
                redirect('entrada_efectivo_caja/index');
            }
            else
            {
                $data['_view'] = 'entrada_efectivo_caja/edit';
                $this->load->view('layouts/main',$data);
            }
        }
        else
            show_error('The entrada_efectivo_caja you are trying to edit does not exist.');
    } 

    /*
     * Deleting entrada_efectivo_caja
     */
    function remove($id)
    {
        $entrada_efectivo_caja = $this->Entrada_efectivo_caja_model->get_entrada_efectivo_caja($id);

        // check if the entrada_efectivo_caja exists before trying to delete it
        if(isset($entrada_efectivo_caja['id']))
        {
            $this->Entrada_efectivo_caja_model->delete_entrada_efectivo_caja($id);
            redirect('entrada_efectivo_caja/index');
        }
        else
            show_error('The entrada_efectivo_caja you are trying to delete does not exist.');
    }





























}