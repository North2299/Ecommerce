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
		//$this->magic_quotes_active = get_magic_quotes_gpc();
		$this->real_escape_string_exists = function_exists("PDO::quote");
		//$this->real_escape_string_exists = function_exists("mysqli_real_escape_string");
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

	/*	$this->conn = mysqli_connect(server,user,pass);
		if(!$this->conn){
			echo "Problem in database connection! Contact administrator!";
			exit();
		 
		}else{

			$db_select = mysqli_select_db($this->conn,database_name);
			if (!$db_select) {
				echo "Problem in selecting database! Contact administrator!";
				exit();
			}
		}*/

	}
	
	function setQuery($sql='') {
		$this->sql_string=$sql;
	}
	function execute() {
		$result = ($this->conn)->exec($this->sql_string);
	//	$result = mysqli_query($this->conn,$this->sql_string);
		$this->confirm_query($result);
		return $result;
	}	
	
	function executeQuery() {
		$result = ($this->conn)->query($this->sql_string);
	//	$result = mysqli_query($this->conn,$this->sql_string);
		$this->confirm_query($result);
		return $result;
	}	
	
	private function confirm_query($result) {
		if(!$result){
			$this->error_no = ($this->conn)->errorCode();
			$this->error_msg = ($this->conn)->errorInfo();
			return false;	
	/*	if(!$result){
			$this->error_no = mysqli_errno($this->conn);
			$this->error_msg = mysqli_error($this->conn);
			return false;				
		}*/}
		return $result;
	} 
	
	function loadResultList( $key='' ) {
		$cur = $this->executeQuery();
		$array = $cur->fetchAll(PDO::FETCH_OBJ) ;
		$cur->closeCursor();

		/*$cur = $this->executeQuery();
		
		$array = array();
		while ($row = mysqli_fetch_object($cur)) {
			if ($key) {
				$array[$row->$key] = $row;
			} else {
				$array[] = $row;
			}
		}
		mysqli_free_result( $cur );*/
		return $array;
	}
	
	function loadSingleResult() {
		$cur = $this->executeQuery();
			
		while ($row = $cur->fetch(PDO::FETCH_OBJ)) {
			return $data = $row;
		}
		$cur->closeCursor();
		//return $data;
	/*	$cur = $this->executeQuery();
			
		while ($row = mysqli_fetch_object($cur)) {
		return $data = $row;
		}
		mysqli_free_result($cur);
		//return $data;*/
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
		//return mysqli_fetch_array($result);
	}
	//gets the number or rows	
	 function num_rows($result_set) {
		return $result_set->rowCount();
		//return mysqli_num_rows($result_set);
	}
  
	 function insert_id() {
	// get the last id inserted over the current db connection
		($this->conn)->lastInsertId() ;
		//return mysqli_insert_id($this->conn);
	}
  
	 function affected_rows() {
		($this->conn)->rowCount() ;
		//return mysqli_affected_rows($this->conn);
	}
	
	  function escape_value( $value ) {

		if( $this->real_escape_string_exists ) { // PHP v4.3.0 or higher
			// undo any magic quote effects so mysql_real_escape_string can do the work
			if($this->magic_quotes_active) { $value = stripslashes($value); }
			$value = ($this->conn)->quote($value);
		} else { // before PHP v4.3.0
			// if magic quotes aren't already on then add slashes manually
			if( !$this->magic_quotes_active ) { $value = addslashes($value); }}
			// if magic quotes are active, then the slashes already exist

		/*if( $this->real_escape_string_exists ) { // PHP v4.3.0 or higher
			// undo any magic quote effects so mysql_real_escape_string can do the work
			if($this->magic_quotes_active) { $value = stripslashes($value); }
			$value = mysqli_real_escape_string($this->conn,$value);
		} else { // before PHP v4.3.0
			// if magic quotes aren't already on then add slashes manually
			if( !$this->magic_quotes_active ) { $value = addslashes($value); }
			// if magic quotes are active, then the slashes already exist
		}*/
		return $value;
   	}
	
	 function close_connection() {
		if(isset($this->conn)) {
			$this->conn = null;
			unset($this->conn);
		
		/*if(isset($this->conn)) {
			mysqli_close($this->conn);
			unset($this->conn);
		}*/}}
	} 
	
$mydb = new Database();

?>