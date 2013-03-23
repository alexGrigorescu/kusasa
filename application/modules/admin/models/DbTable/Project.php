<?php

class Admin_Model_DbTable_Project extends Zend_Db_Table_Abstract
{
    protected $_name = 'projects';
    protected $_primary = 'id';

    public function getAll($toArray){
        $select = $this->select()
            ->setIntegrityCheck(false)
            ->from(array('p' => 'projects'), array('p.*'))
            ->joinLeft(array('c' => 'project_categories'), ' pow(2,c.id) | p.category_id = p.category_id ',
            array('category_name' => 'ifnull(group_concat(c.name separator ", "), "N/A")'))
            ->group('p.id')
            ->order(array('p.id DESC'));

        return ($toArray)? $this->fetchAll($select)->toArray() : $this->fetchAll($select);
    }

    public function getLatest($latestCount, $toArray = true ){
        $select = $this->select()
            ->setIntegrityCheck(false)
            ->from(array('p' => 'projects'), array('p.*'))
            ->joinLeft(array('c' => 'project_categories'), ' pow(2,c.id) | p.category_id = p.category_id ',
                array('category_name' => 'ifnull(group_concat(c.name separator ", "), "N/A")'))
            ->group('p.id')
            ->order(array('p.id DESC'))
            ->limit($latestCount);

        return ($toArray)? $this->fetchAll($select)->toArray() : $this->fetchAll($select);
    }

    public function getByCategory($count, $categoryId, $toArray = true){
        $select = $this->select()
            ->setIntegrityCheck(false)
            ->where(' pow(2, ?) | category_id = category_id ', $categoryId)
            ->order(array('id DESC'))
            ->limit($count);

        return ($toArray)? $this->fetchAll($select)->toArray() : $this->fetchAll($select);
    }


}
