<?php
/* 
 * Generated by CRUDigniter v3.2 
 * www.crudigniter.com
 */
 
class Seccion_model extends CI_Model
{
    function __construct()
    {
        parent::__construct();
    }
    
    /*
     * Get seccion by id
     */
    function get_seccion($id)
    {
        return $this->db->get_where('seccion',array('id'=>$id))->row_array();
    }
        
    /*
     * Get all seccion
     */
    function get_all_seccion()
    {
        $this->db->order_by('id', 'desc');
        return $this->db->get('seccion')->result_array();
    }
        
    /*
     * function to add new seccion
     */
    function add_seccion($params)
    {
        $this->db->insert('seccion',$params);
        return $this->db->insert_id();
    }
    
    /*
     * function to update seccion
     */
    function update_seccion($id,$params)
    {
        $this->db->where('id',$id);
        return $this->db->update('seccion',$params);
    }
    
    /*
     * function to delete seccion
     */
    function delete_seccion($id)
    {
        return $this->db->delete('seccion',array('id'=>$id));
    }
}
