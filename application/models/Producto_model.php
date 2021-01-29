<?php
/* 
 * Generated by CRUDigniter v3.2 
 * www.crudigniter.com
 */
 
class Producto_model extends CI_Model
{
    function __construct()
    {
        parent::__construct();
    }
    
    /*
     * Get producto by id
     */
    function get_producto($id)
    {
        return $this->db->get_where('productos',array('id'=>$id))->row_array();
    }

    /*
     * Get producto codigo or Nombre
     */
    function get_producto_codigo_nombre($parametro)
    {
        $this->db->where('nombre', $parametro);
        $this->db->or_where('codigo', $parametro);
        return $this->db->get('productos')->result_array();
    }
        
    /*
     * Get all productos
     */
    function get_all_productos()
    {
        $this->db->order_by('id', 'desc');
        return $this->db->get('productos')->result_array();
    }
        
    /*
     * function to add new producto
     */
    function add_producto($params)
    {
        $this->db->insert('productos',$params);
        return $this->db->insert_id();
    }
    
    /*
     * function to update producto
     */
    function update_producto($id,$params)
    {
        $this->db->where('id',$id);
        return $this->db->update('productos',$params);
    }
    
    /*
     * function to delete producto
     */
    function delete_producto($id)
    {
        return $this->db->delete('productos',array('id'=>$id));
    }

    /**
     * MODELOS DESCONTAR DE INVENTARIO LA CANTIDAD VENDIDA
     */
    function descuentaStock($nombre,$cantidad){
        $this->db->where('nombre',$nombre);
        $this->db->select('id,stock');
        $result = $this->db->get('productos')->result_array();
        $restante = $result[0]['stock'] - $cantidad;
        $this->db->where('id',$result[0]['id']);
        $params = array('stock' => $restante );
        $this->db->update('productos',$params);
        return $restante;
    }
    function addStock($id,$cant){
        $cantidad = intval($cant);
        $id_item = intval($id);
        $this->db->where('id',$id_item);
        $this->db->select('id,stock,nombre');
        $result = $this->db->get('productos')->result_array();
        $actual = intval($result[0]['stock']);
        $restante = 0;
        $restante = ($actual) + ($cantidad);
        $this->db->where('id',$result[0]['id']);
        $params = array('stock' => $restante );
        $this->db->update('productos',$params);
        return $result[0]['nombre'];
    }

    function get_minimo_stock_productos(){
        $sql = "SELECT nombre,stock,imagen, IF(stock <= stock_minimo,'true','false') AS abastecer FROM productos";
        $query = $this->db->query($sql);
        $items = $query->result_array();
        return $items;
    }
}
