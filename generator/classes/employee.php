<?php
include ("role.php");

class Employee {
    public int $employee_id;
    public string $first_name;
    public string $last_name;
    public Role $role;
    public DateTimeImmutable $start_date;
    public $end_date;
    
    function __construct(string $first_name, string $last_name, Role $role, DateTimeImmutable $start_date, $end_date=null) {
        $this->first_name = $first_name;
        $this->last_name = $last_name;
        $this->role = $role;
        $this->start_date = $start_date;
        $this->end_date = $end_date;
    }

    function setID(int $new_id) {
        $this->employee_id = $new_id;
    }

    function getID() {
        return $this->employee_id;
    }

    function getNonKeyColumns() {
        return array("first_name", "last_name", "start_date");
    }

    function toArray() {
        $out = array($this->first_name, $this->last_name, $this->start_date);
        if ($this->end_date != null) {
            array_push($out, $this->end_date);
        }
        return $out;
    }
}

?>