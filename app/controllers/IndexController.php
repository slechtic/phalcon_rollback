<?php

class IndexController extends ControllerBase {

	public function indexAction() {

		$db = $this->di->get('db');

		try {
			var_dump("Start!!");

			$db->begin();

			var_dump('First transaction is opened. Is under transaction: ' . (int) $db->isUnderTransaction());
			var_dump('First transaction is opened. Transaction level is ' . $db->getTransactionLevel());

			$gender = \Gender::findFirst(1);

			// Create user object and set gender relation
			$user = new User();
			$user->setName('Roc');
			$user->gender = $gender;

			// store user, but error occurs
			$user->save();

			$db->commit();

			var_dump("Commit!!!");
			var_dump('First transaction is commited. Is under transaction: ' . (int) $db->isUnderTransaction());
			var_dump('First transaction is commited. Transaction level is ' . $db->getTransactionLevel());
		} catch (\Exception $e) {
			var_dump('Catch: ' . $e->getMessage());
			$db->rollback();
			var_dump('First transaction is rollbacked. Is under transaction: ' . (int) $db->isUnderTransaction());
			var_dump('First transaction is rollbacked. Transaction level is ' . $db->getTransactionLevel());
		}

		/*
		 * The problem is here.
		 * Now, when the data are fetched via \Phalcon\MVC\Model, exception 'SQLSTATE[25P02]: In failed sql 
		 * transaction: 7 ERROR: current transaction is aborted, commands ignored until end of transaction block' occurs
		 * 
		 * If you can use raw sql below, it's correct
		 */
		try {
			$db->begin();
			var_dump('Second transaction is opened. Is under transaction: ' . (int) $db->isUnderTransaction());
			var_dump('Second transaction is opened. Transaction level is ' . $db->getTransactionLevel());

			$users = \User::find();
			var_dump($users);

			$db->commit();
		} catch (\Exception $e) {
			var_dump('Catch: ' . $e->getMessage());
			$db->rollback();
			var_dump('Second transaction is rollbacked. Is under transaction: ' . (int) $db->isUnderTransaction());
			var_dump('Second transaction is rollbacked. Transaction level is ' . $db->getTransactionLevel());
		}

//		$sql = 'select * from users;';
//		$result = $db->query($sql);
//		$result->setFetchMode(\Phalcon\Db::FETCH_ASSOC);
//		$result = $result->fetchAll($result);
//		var_dump($result);

		var_dump("Done!!!");
		die;
	}

}
