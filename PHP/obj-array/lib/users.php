<?php
// Creating a user class
class users extends controllerClass {

  public function readableDateFunc(){
    return date('d/m/Y H:m:i', $this->created);
  }

  public function aliasGen(){
    return [
      'full_name' => $this->firstname . ' ' . $this->surname,
      'isAdmin' => (bool) ($this->role == 'Admin'),
      'isMod' => (bool) ($this->role == 'Moderator'),
      'isUser' => (bool) ($this->role == 'User'),
      'readableDate' => $this->readableDateFunc()
    ];
  }
}

?>
