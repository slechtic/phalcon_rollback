<?php

/**
 * User domain class
 */
class User extends \Phalcon\Mvc\Model {

	/** integer */
	protected $id;

	/** string */
	protected $name;

	public function initialize() {
		$this->setSource('users');
		$this->belongsTo('idGender', '\Bbx\Domain\Gender', 'id', array('alias' => 'gender'));
	}

	function getId() {
		return $this->id;
	}

	function getName() {
		return $this->name;
	}

	function setId($id) {
		$this->id = $id;
	}

	function setName($name) {
		$this->name = $name;
	}

	/**
	 * Column map 
	 * @return array
	 */
	public function columnMap() {
		return array(
			'id' => 'id',
			'name' => 'name',
			'id_gender' => 'idGender'
		);
	}

}
