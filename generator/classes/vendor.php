<?php

class Vendor {
    public int $vendor_id;
    public string $vendor_name;

    function __construct($vendor_name) {
        $this->vendor_name = $vendor_name;
    }

    function getID() {
        return $this->vendor_id;
    }

    function getNonKeyColumns() {
        return array("vendor_name");
    }

    function setID(int $new_id) {
        $this->vendor_id = $new_id;
    }

    function toArray() {
        return array($this->vendor_name);
    }
}
?>