<?php

/**
 * Gender
 */
class Gender extends \Phalcon\Mvc\Model {

	/** @var integer */
	protected $id;

	/** @var string */
	protected $key;

	/**
	 * Initialize
	 */
	public function initialize() {
		$this->setSource('genders');
	}

	function getId() {
		return $this->id;
	}

	function getKey() {
		return $this->key;
	}

	function setId($id) {
		$this->id = $id;
	}

	function setKey($key) {
		$this->key = $key;
	}

	/**
	 * Column map 
	 * @return array
	 */
	public function columnMap() {
		return array(
			'id' => 'id',
			'key' => 'key'
		);
	}

}
