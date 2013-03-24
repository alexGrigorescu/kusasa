<?php

class Admin_Model_Pages extends Core_MainModel
{
    public $id;
    public $category_id;
    public $title;
    public $content;
    public $added;


    public function __construct($id = 0){
        if($id != 0){
            parent::__construct('Admin_Model_DbTable_Pages', $id);
        }else{
            parent::__construct('Admin_Model_DbTable_Pages');
        }
    }


    public function save($data)
    {
        $data = $this->_mapFormToDb($data);

        // insert
        if (empty($data['id'])) {
            return $this->getDbTable()->insert($data);
        }

        // update
        return $this->getDbTable()->update(
            $data,
            array('id = ?' => $data['id'])
        );
    }

    public function delete($id)
    {
        return $this->getDbTable()->delete(
            array('id = ?' => $id)
        );
    }

    public function getAll($asArray = false){
        return $this->getDbTable()->getAll($asArray);
    }

    public function _toArray($data){
        return array(
            'id'            => $data['id'],
            'category_id'   => $data['category_id'],
            'title'         => $data['title'],
            'content'       => $data['content'],
        );
    }

    public function getServices(){
        $results = $this->getDbTable()->getServices();
        $services = array();
        foreach($results as $result){
            $services[] = $this->_toArray($result);
        }
        return $services;
    }

    protected function _mapFormToDb($data){
        return array(
            'id'            => (!empty($data['page_id']))? $data['page_id']: null,
            'category_id'   => $data['category_id'],
            'title'         => $data['page_title'],
            'content'       => $data['page_content'],
            'added'         => date('Y-m-d H:i:s')
        );
    }
}

