<?php

class Role {
    public int $role_id;
    public string $role_name;

    function __construct($role_name) {
        $this->role_name = $role_name;
    }

    function getID() {
        return $this->role_id;
    }

    function setID(int $new_id) {
        $this->role_id = $new_id;
    }

    function toArray() {
        return array($this->role_name);
    }

    function getNonKeyColumns() {
        return array("role_name");
    }
}
?>