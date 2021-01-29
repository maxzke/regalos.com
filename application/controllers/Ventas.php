<?php
 
class Ventas extends MY_Controller{
    function __construct()
    {
        parent::__construct();
        $this->require_min_level(1);
        if( !$this->is_role('admin') or !$this->is_role('vendedor')){
            redirect('restringido');
        }
        $this->load->model('Producto_model');
    } 











}//end class