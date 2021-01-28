<?php
class User extends UserAbstract{
        static public $countUser = 0;
        public $name = '';
        public $login = '';
        public $password = '';

        
        function __construct($name, $login, $password)
        {
           self::$countUser++;

            $this->name = $name;
            $this->login = $login; 
            $this->password = $password; 
        }
        
        
        public function showInfo(){
            echo "Name: ".$this->name."<br>"."Login: ".$this->login."<br>"."Password: ".$this->password."<br><br>";
        }

        function __destruct()
        {
            print "Пользователь ".$this->login." удален <br><br>";
        }
}
?>