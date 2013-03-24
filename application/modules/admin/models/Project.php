<?php

class Admin_Model_Project extends Core_MainModel
{
    public $id;
    public $title;
    public $description;
    public $gallery;
    public $featured;
    public $category_id;
    public $added;

	public function __construct($id = 0){
		if($id != 0){
			parent::__construct('Admin_Model_DbTable_Project', $id);
		}else{
			parent::__construct('Admin_Model_DbTable_Project');
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

    public function getAll($asArray = false){
        $results = $this->getDbTable()->getAll($asArray);
        $projects = array();
        foreach($results as $result){
            $projects[] = $this->_toArray($result);
        }
        return $projects;
    }

    public function getLatest($asArray = false){
        $latestCount = 5;
        $results = $this->getDbTable()->getLatest($latestCount, $asArray);
        $projects = array();
        foreach($results as $result){
            $projects[] = $this->_toArray($result);
        }
        return $projects;
    }

    public function getExclusive(){
        $exclusive = 1;
        $count = 3;
        $results = $this->getDbTable()->getByCategory($count, $exclusive);
        $projects = array();
        foreach($results as $result){
            $projects[] = $this->_toArray($result);
        }
        return $projects;
    }

    public function _toArray($data){
        return array(
            'id'            => $data['id'],
            'title'         => $data['title'],
            'description'   => $data['description'],
            'gallery'       => explode('|', $data['gallery']),
            'featured'      => $data['featured'],
            //'category_name' => $data['category_name'],
            'category_id'   => $data['category_id'],
            'excerpt'       => $this->utils->getExcerpt($data['description'], 300),
        );
    }

    protected function _mapFormToDb($data){
        return array(
            'id'            => (!empty($data['project_id']))? $data['project_id']: null,
            'title'         => $data['project_title'],
            'description'   => $data['project_description'],
            'gallery'       => $data['gallery'],
            'category_id'   => $this->mapCategoriesToBinary($data['category_id']),
            'added'         => date('Y-m-d H:i:s')
        );
    }

    public function mapBinaryToCategories($categoryId){
        return $this->utils->mapBinaryToArray($categoryId);
    }

    public function mapCategoriesToBinary($categories){
        return $this->utils->mapArrayToBinary($categories);
    }
}

