<?php

class Admin_Model_DbTable_ProjectCategory extends Zend_Db_Table_Abstract
{
    protected $_name = 'project_categories';
    protected $_primary = 'id';

    public function getAll($toArray = false){
        $select = $this->select()
            ->setIntegrityCheck(false)
            ->from(array('c' => 'project_categories'),
                array('category_id' => 'c.id', 'name' => 'c.name'))
            ->order(array('name ASC'));
        return ($toArray)? $this->fetchAll($select)->toArray() : $this->fetchAll($select);
    }
}
