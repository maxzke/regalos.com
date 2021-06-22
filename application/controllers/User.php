<?php
defined('BASEPATH') or exit('No direct script access allowed');
 
class User extends MY_Controller{
    function __construct()
    {
        parent::__construct();
        $this->require_min_level(1);
        if( !$this->is_role('admin') ){
            redirect('restringido');
        }
        $this->load->model('User_model');
    } 

    /*
     * Listing of users
     */
    function index(){
            $params['limit'] = RECORDS_PER_PAGE;
            $params['offset'] = ($this->input->get('per_page')) ? $this->input->get('per_page') : 0;
            
            $config = $this->config->item('pagination');
            $config['base_url'] = site_url('user/index?');
            $config['total_rows'] = $this->User_model->get_all_users_count();
            $this->pagination->initialize($config);

            $data['users'] = $this->User_model->get_all_users($params);
            $data['alertas'] = $this->check_min_stock();
            //$data['pagina_activa'] = "venta,productos,reportes"
            $data['pagina_activa'] = "usuarios";
            $data['_view'] = 'user/index';
            $this->load->view('layouts/main',$data);
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

    /*
     * Adding a new user
     */
    function add(){  

        if(isset($_POST) && count($_POST) > 0){   
            $params = array(
                'auth_level' => $this->input->post('auth_level'),
                'username' => $this->input->post('username'),
                'email' => $this->input->post('email'),
                'passwd' => $this->input->post('passwd'),
            );
            
            $user_id = $this->User_model->add_user($params);
            redirect('user/index');
        }
        else
        {            
            $data['alertas'] = $this->check_min_stock();
            $data['_view'] = 'user/add';
            //$data['pagina_activa'] = "venta,productos,reportes"
            $data['pagina_activa'] = "usuarios";
            $this->load->view('layouts/main',$data);
        }
        
    }  

    /*
     * Editing a user
     */
    function edit($user_id)
    {   
        // check if the user exists before trying to edit it
        $data['user'] = $this->User_model->get_user($user_id);
        
        if(isset($data['user']['user_id']))
        {
            if(isset($_POST) && count($_POST) > 0)     
            {   
                if ($this->input->post('passwd')=="") {
                    $params = array(
                        'auth_level' => $this->input->post('auth_level'),
                        'username' => $this->input->post('username'),
                        //'email' => $this->input->post('email'),
                        //'passwd' => $this->input->post('passwd'),
                    );
                }else{
                    $encriptado = $this->authentication->hash_passwd($this->input->post('passwd'));
                    $params = array(
                        'auth_level' => $this->input->post('auth_level'),
                        'username' => $this->input->post('username'),
                        //'email' => $this->input->post('email'),
                        'passwd' => $encriptado,
                    );
                }

                

                $this->User_model->update_user($user_id,$params);            
                redirect('user/index');
            }
            else
            {
                $data['_view'] = 'user/edit';
                $data['alertas'] = $this->check_min_stock();
                //$data['pagina_activa'] = "venta,productos,reportes"
                $data['pagina_activa'] = "usuarios";
                
                $this->load->view('layouts/main',$data);
            }
        }
        else
            show_error('The user you are trying to edit does not exist.');
    } 

    /*
     * Deleting user
     */
    function remove($user_id){

                        
                $user = $this->User_model->get_user($user_id);

                // check if the user exists before trying to delete it
                if(isset($user['user_id']))
                {
                    $this->User_model->delete_user($user_id);
                    redirect('user/index');
                }
                else{
                    $msg = "El usuario que intentas borrar no existe.";
                    $this->session->set_flashdata('usuario_creado', $msg);
                    redirect('user/index');
                }
            }
        




    
}// end class
