<?php
// Creating a user class
abstract class controllerClass {

  private $pk;
  private $fields;
  private $where;
  private $table;
  private $order;
  private $limit;

  private $connection;

  abstract function aliasGen();

  // Create alias fields (A field that's made of other fields and
  //  dosn't actully exist, you can just pretend it does)
  protected function genAlias($aliasArr){

    // Generate any alias fields we may want
    foreach($aliasArr as $name => $value){
      $this->{$name} = $value;
    }

    return true;
  }

  public function get($options = []){

    if (array_key_exists('pk', $options)) {
      $this->pk = $options['pk'];
    } else {
      return false;
    }

    $this->conditionCheck($options);

    $this->genAlias($this->query());

    $this->genAlias($this->aliasGen());


  }

  private function query(){
    $this->connection =  new mysqli(config::$mysql['Server'], config::$mysql['User'], config::$mysql['Password'], config::$mysql['Database']);

    $returnData = $this->connection->query($this->genSelect());

    $returnData2 = $returnData->fetch_assoc();

    $returnData->free();

    $this->connection->close();

    $this->connection = '';

    return $returnData2;
  }

  public function conditionCheck($options = []){

    if(array_key_exists('table', $options)){
      $this->table = $options['table'];
    } else {
      $this->table = get_class($this);
    }

    if(array_key_exists('where', $options)){
      $this->where = $options['where'];
    } else $this->where = '1 = 1';

    if (array_key_exists('fields', $options)) {
      foreach($options['fields'] as $field){
        $this->fields .= '`' . $field . '`, ';
      }

      $this->fields = substr($this->fields, 0, (strlen($this->fields) - 2));
    } else $this->fields = '*';

    if(array_key_exists('order', $options)){
      $this->order = $options['order'];
    }

    if(array_key_exists('limit', $options)){
      $this->limit = $options['limit'];
    }
  }

  private function genSelect(){

    $query = 'SELECT ';

    if(!empty($this->fields)){
      $query .= $this->fields;
    }

    if(!empty($this->table)){
      $query .= ' FROM '.$this->table;
    }

    if(!empty($this->where)){
      $query .= ' WHERE '.$this->where;
    }

    if(!empty($this->order)){
      $query .= ' ORDER BY '.$this->order;
    }

    if(!empty($this->limit)){
      $query .= ' LIMIT '.$this->limit;
    }

    return $query;
  }
}

?>
