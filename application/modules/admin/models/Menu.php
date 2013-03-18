<?php

class Admin_Model_Menu extends Core_MainModel
{
    public $id;
    public $parent_id;
    public $title;
    public $url;
    public $class;
    public $position;
    public $descendants = array(); // array with all descendants of a menu item


	public function __construct($id = 0){
        if($id != 0){
            parent::__construct('Admin_Model_DbTable_Menu', $id);
        }else{
            parent::__construct('Admin_Model_DbTable_Menu');
        }
	}
	
    public function getAll($asArray = false){
        return $this->getDbTable()->getAll($asArray);
    }

    public function save($data)
    {
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

    public function delete($id){
        $this->getDescendants($id);

        if (!empty($this->descendants)) {
            $ids = implode(', ', $this->descendants);
            $id = "$id, $ids";
        }
        $this->getDbTable()->deleteTree($id);
    }

    /**
     * Recursive method
     * Get all descendant ids from current id
     * @param $id
     */
    private function getDescendants($id) {
        $data = $this->getDbTable()->getDirectDescendants($id);
        if (!empty($data)) {
            foreach ($data as $v) {
                $this->descendants[] = $v['id'];
                $this->getDescendants($v['id']);
            }
        }
    }

    /**
     * Get the highest position number
     *
     * @param int $group_id
     * @return string
     */
    public function getLastPosition() {
        return $this->getDbTable()->getLastPosition();
    }
}

