<?php

class Admin_Model_ProjectCategory extends Core_MainModel
{
    public $id;
    public $name;
    public $added;


	public function __construct($id = 0){
		if($id != 0){
			parent::__construct('Admin_Model_DbTable_ProjectCategory', $id);
		}else{
			parent::__construct('Admin_Model_DbTable_ProjectCategory');
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

    protected function _mapFormToDb($data){
        return array(
            'id'        => (!empty($data['id']))? $data['id']: null,
            'name'      => $data['category_name'],
            'added'     => date('Y-m-d H:i:s')
        );
    }
}

