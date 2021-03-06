<?php
/* 
 * Generated by CRUDigniter v3.2 
 * www.crudigniter.com
 */
 
class Producto extends MY_Controller{
    function __construct()
    {
        parent::__construct();
        $this->require_min_level(1);
        $this->load->model('Producto_model');
        
    } 

    public function get_all(){
        $data['productos'] = $this->Producto_model->get_all_productos();
        $data['success'] = TRUE;
        echo json_encode($data);
    }

    public function getProductoByCodigo(){
        $cod = $this->input->post('codigo');
        $response['producto'] = $this->Producto_model->get_producto_codigo($cod);
        if ($response['producto'] == null) {
            $response['success'] = FALSE;
        }else{
            $response['success'] = TRUE;
        }
        echo json_encode($response);
    }

    /**
     * ABASTECER PRODUCTO
     */
    public function abastecer(){
        $this->load->library('form_validation');
        $this->load->library('session'); 

		// $this->form_validation->set_rules('id','Nombre','required');
         $this->form_validation->set_rules('cantidad','Precio','required|numeric');
         if($this->form_validation->run()){
        //     $id = $this->input->post('id');
        //     $cantidad = $this->input->post('cantidad');
        //     $result = $this->Producto_model->addStock($id,$cantidad);
        //     $text = $result;
        //     $this->session->set_flashdata('item',$text);
        //     //print_r($result);
        //     redirect('producto');
                

            $id = $this->input->post('id');
            $cantidad = $this->input->post('cantidad');
            $result = $this->Producto_model->addStock($id,$cantidad);
            if ($result) {
                $msg['success'] = TRUE;
            }else{
                $msg['success'] = FALSE;
            }
        }else{
            $msg['success'] = FALSE;
        }
            echo json_encode($msg);
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

    
    // function index()
    // {
    //     if( !$this->is_role('admin') ){
    //         redirect('restringido');
    //     }
    //     /**
    //      * PAGINACION
    //      */
    //     $params['limit'] = 10; 
    //     $params['offset'] = ($this->input->get('per_page')) ? $this->input->get('per_page') : 0;
    //     $config = $this->config->item('pagination');
    //     $config['base_url'] = site_url('producto/index?');
    //     $config['total_rows'] = $this->Producto_model->get_all_count();
    //     $config['per_page'] = 10;
    //     $this->pagination->initialize($config);
    //     $data['productos'] = $this->Producto_model->get_all_productos_paginados($params);
    //     /**
    //      * PAGINACION FIN
    //      */
    //     $data['productos'] = $this->Producto_model->get_all_productos();
    //     //$data['pagina_activa'] = "venta,productos,reportes"
    //     $data['pagina_activa'] = "productos";
    //     $this->load->model('Categoria_model');
    //     $data['categorias'] = $this->Categoria_model->get_all_categorias();
    //     $data['alertas'] = $this->check_min_stock();

    //     $data['_view'] = 'producto/index';
    //     $this->load->view('layouts/main',$data);
    // }

    /*
     * Listing of productos
     */
    function paginado(){
        if( !$this->is_role('admin') ){
            redirect('restringido');
        }
        /**
         * PAGINACION
         */
        $params['limit'] = 10; 
        $params['offset'] = ($this->input->get('per_page')) ? $this->input->get('per_page') : 0;
        $config = $this->config->item('pagination');
        $config['base_url'] = site_url('producto/paginado?');
        $config['total_rows'] = $this->Producto_model->get_all_count();
        $config['per_page'] = 10;
        $this->pagination->initialize($config);
        $data['productos'] = $this->Producto_model->get_all_productos_paginados($params);
        /**
         * PAGINACION FIN
         */
        
        //$data['pagina_activa'] = "venta,productos,reportes"
        $data['pagina_activa'] = "productos";
        $this->load->model('Categoria_model');
        $data['categorias'] = $this->Categoria_model->get_all_categorias();
        $data['alertas'] = $this->check_min_stock();
        $data['total_rows_de'] = $params['offset']+1;
        $data['total_rows_al'] = $params['offset']+$config['per_page'];
        $data['total_rows'] = $this->Producto_model->get_all_count();
        $data['_view'] = 'producto/index';
        $this->load->view('layouts/main',$data);


    }
    
    /**
     * DEVUELVE LAS CONSIDENCIAS
     */
    function consulta(){
        $parametro = $this->input->post('busqueda');
        $data['response'] = $this->Producto_model->buscador($parametro);
        $data['success'] = TRUE;
        $data['consulta'] = $parametro;
        echo json_encode($data);
    }

    /*
     * Adding a new producto
     */
    function add()
    {   
        if( !$this->is_role('admin') ){
            redirect('restringido');
        }
        $this->load->library('form_validation');

        $this->form_validation->set_message('required', '{field} es requerido');
        $this->form_validation->set_message('is_unique', 'Este {field} ya esta registrado');
        $this->form_validation->set_message('integer', '{field} debe ser número entero');
        $this->form_validation->set_message('numeric', '{field} debe ser número');

		$this->form_validation->set_rules('nombre','Nombre','required');
		$this->form_validation->set_rules('precio','Precio','required|numeric');
        $this->form_validation->set_rules('stock','Stock','integer|required');
        $this->form_validation->set_rules('codigo','Código','is_unique[productos.codigo]');
		//$this->form_validation->set_rules('id_categoria','Id Categoria','required');
		//$this->form_validation->set_rules('costo','Costo','numeric');
		
		if($this->form_validation->run())     
        {   
            
                    $params = array(
                        'codigo' => $this->input->post('codigo'),
                        'inventariable' => 1,
                        'id_categoria' => 1,
                        'stock_minimo' => 1,
                        'nombre' => $this->input->post('nombre'),
                        'precio' => $this->input->post('precio'),
                        //'costo' => $this->input->post('costo'),
                        //'imagen' => $rutaFoto,
                        'stock' => $this->input->post('stock'),
                    );
                    
                    $producto_id = $this->Producto_model->add_producto($params);
                    redirect('productos');
                
        }
        else
        {
			$this->load->model('Categoria_model');
			$data['all_categorias'] = $this->Categoria_model->get_all_categorias();
            $data['img_error'] = "";
            $data['_view'] = 'producto/add';
            $data['alertas'] = $this->check_min_stock();
            //$data['pagina_activa'] = "venta,productos,reportes"
            $data['pagina_activa'] = "productos";
            $this->load->view('layouts/main',$data);
        }
    }  

    /*
     * Editing a producto
     */
    function edit($id)
    {   
        if( !$this->is_role('admin') ){
            redirect('restringido');
        }
        // check if the producto exists before trying to edit it
        $data['producto'] = $this->Producto_model->get_producto($id);
        
        if(isset($data['producto']['id']))
        {
            $this->load->library('form_validation');

            $this->form_validation->set_message('required', '{field} es requerido');
            $this->form_validation->set_message('is_unique', 'Este {field} ya esta registrado');
            $this->form_validation->set_message('integer', '{field} debe ser número entero');
            $this->form_validation->set_message('numeric', '{field} debe ser número');

			$this->form_validation->set_rules('nombre','Nombre','required');
			$this->form_validation->set_rules('precio','Precio','required|numeric');
            $this->form_validation->set_rules('stock','Stock','integer');
            //$this->form_validation->set_rules('codigo','Código','is_unique[productos.codigo]');
			//$this->form_validation->set_rules('id_categoria','Id Categoria','required');
			$this->form_validation->set_rules('costo','Costo','decimal');
		
			if($this->form_validation->run())     
            {   
                $params = array(
					'inventariable' => $this->input->post('inventariable'),
					'id_categoria' => $this->input->post('id_categoria'),
					'stock_minimo' => $this->input->post('stock_minimo'),
					'nombre' => $this->input->post('nombre'),
					'precio' => $this->input->post('precio'),
					'costo' => $this->input->post('costo'),
					'imagen' => $this->input->post('imagen'),
                    'stock' => $this->input->post('stock'),
                    'codigo' => $this->input->post('codigo'),
                );

                $this->Producto_model->update_producto($id,$params);            
                redirect('productos');
            }
            else
            {
				$this->load->model('Categoria_model');
				$data['all_categorias'] = $this->Categoria_model->get_all_categorias();
                $data['alertas'] = $this->check_min_stock();
                $data['_view'] = 'producto/edit';
                //$data['pagina_activa'] = "venta,productos,reportes"
                $data['pagina_activa'] = "productos";
                $this->load->view('layouts/main',$data);
            }
        }
        else
            show_error('The producto you are trying to edit does not exist.');
    } 

    /*
     * Deleting producto
     */
    function remove($id)
    {
        if( !$this->is_role('admin') ){
            redirect('restringido');
        }
        $producto = $this->Producto_model->get_producto($id);

        // check if the producto exists before trying to delete it
        if(isset($producto['id']))
        {
            $this->Producto_model->delete_producto($id);
            redirect('productos');
        }
        else
            show_error('The producto you are trying to delete does not exist.');
    }
    
}
