<?php

class Admin_Model_DbTable_Menu extends Zend_Db_Table_Abstract
{
    protected $_name = 'menu';
    protected $_primary = 'id';

    public function getAll($toArray = false){
        return ($toArray)? $this->fetchAll()->toArray() : $this->fetchAll();
    }

    public function getLastPosition(){
        $select = $this->select()
            ->from('menu', array('last_position' => 'max(position)'))
            ->setIntegrityCheck(false)
            ->where('parent_id = 0');

        $result = $this->fetchRow($select);
        return $result['last_position'];
    }

    public function getDirectDescendants($id){
        $select = $this->select()
            ->from('menu', array('id'))
            ->setIntegrityCheck(false)
            ->where('parent_id = ?', $id);

        return $this->fetchAll($select)->toArray();
    }

    public function deleteTree($id){
        $this->delete(
            array('id in ( ? )' => $id)
        );

        return $id;
    }
}
