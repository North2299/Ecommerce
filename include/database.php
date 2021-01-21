<?php
require_once(LIB_PATH.DS."config.php");
class Database {
	var $sql_string = '';
	var $error_no = 0;
	var $error_msg = '';
	private $conn;
	public $last_query;
	private $magic_quotes_active;
	private $real_escape_string_exists;




	
	function __construct() {
		$this->open_connection();
		$this->real_escape_string_exists = function_exists("PDO::quote");
	}
	
	public function open_connection() {
		try {
			$server = server ; $database_name= database_name ;
			$this->conn = new PDO("mysql:host=$server;dbname=$database_name", user, pass);
			// set the PDO error mode to exception
			$this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

		  } catch(PDOException $e) {
			echo "Connection failed: " . $e->getMessage();
		  }



	}
	
	function setQuery($sql='') {
		$this->sql_string=$sql;
	}
	function execute() {
		$result = ($this->conn)->exec($this->sql_string);
		$this->confirm_query($result);
		return $result;
	}	
	
	function executeQuery() {
		$result = ($this->conn)->query($this->sql_string);

		$this->confirm_query($result);
		return $result;
	}	
	
	private function confirm_query($result) {
		if(!$result){
			$this->error_no = ($this->conn)->errorCode();
			$this->error_msg = ($this->conn)->errorInfo();
			return false;	
	}
		return $result;
	} 
	
	function loadResultList( $key='' ) {
		$cur = $this->executeQuery();
		$array = $cur->fetchAll(PDO::FETCH_OBJ) ;
		$cur->closeCursor();

		
		return $array;
	}
	
	function loadSingleResult() {
		$cur = $this->executeQuery();
			
		while ($row = $cur->fetch(PDO::FETCH_OBJ)) {
			return $data = $row;
		}
		$cur->closeCursor();

	}
	
	function getFieldsOnOneTable($tbl_name) {
	
		$this->setQuery("DESC ".$tbl_name);
		$rows = $this->loadResultList();
		
		$f = array();
		for ( $x=0; $x<count($rows); $x++ ) {
			$f[] = $rows[$x]->Field;
		}
		
		return $f;
	}	

	 function fetch_array($result) {
		return $result->fetchAll(PDO::FETCH_BOTH) ;
		
	}
	
	 function num_rows($result_set) {
		return $result_set->rowCount();
		
	}
  
	 function insert_id() {
	
		($this->conn)->lastInsertId() ;
		
	}
  
	 function affected_rows() {
		($this->conn)->rowCount() ;
		
	}
	
	  function escape_value( $value ) {

		if( $this->real_escape_string_exists ) { 
			if($this->magic_quotes_active) { $value = stripslashes($value); }
			$value = ($this->conn)->quote($value);
		} else { 
			if( !$this->magic_quotes_active ) { $value = addslashes($value); }}
			

		
		return $value;
   	}
	
	 function close_connection() {
		if(isset($this->conn)) {
			$this->conn = null;
			unset($this->conn);
		
		}}
	} 
	
$mydb = new Database();

?>