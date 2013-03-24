<?php

class Admin_Model_DbTable_Pages extends Zend_Db_Table_Abstract
{
    protected $_name = 'pages';
    protected $_primary = 'id';

    public function getAll($toArray = false){
        $select = $this->select()
            ->setIntegrityCheck(false)
            ->from(array('p' => 'pages'), array('p.*'))
            ->joinLeft(array('c' => 'page_categories'), 'p.category_id = c.id',
                array('category_name' => 'ifnull(name, "N/A")'))
            ->order(array('p.id DESC'));

        return ($toArray)? $this->fetchAll($select)->toArray() : $this->fetchAll($select);
    }

    public function getServices($toArray = false){
        $select = $this->select()
            ->setIntegrityCheck(false)
            ->from(array('p' => 'pages'), array('p.*'))
            ->where('p.category_id = 1')
            ->order(array('p.id ASC'));

        return ($toArray)? $this->fetchAll($select)->toArray() : $this->fetchAll($select);
    }
}
