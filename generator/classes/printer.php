<?php
include_once "part.php";
include_once "material.php";
include_once "vendor.php";

class Printer {
    public bool $is_busy;
    public bool $is_available;
    public bool $is_connected;
    public bool $needs_service;
    public bool $has_error;

    public int $printer_id;
    public string $location;
    public string $ip_address;
    public string $model;
    public Vendor $vendor;

    public array $parts;
    public array $materials;
    public array $mats_can_print;

    function __construct(string $location, string $ip_address, string $model, Vendor $vendor) {
        $this->location = $location;
        $this->ip_address = $ip_address;
        $this->model = $model;
        $this->vendor = $vendor;
        $this->setStatus("available");
        $this->parts = array();
        $this->materials = array();
        $this->mats_can_print = array();
    }

    function getStatus() {
        if (!$this->is_connected) {
            return "NOT CONNECTED";
        }
        else if ($this->is_available) {
            return "AVAILABLE";
        }
        else if ($this->is_busy) {
            return "BUSY";
        }
        else if ($this->needs_service) {
            return "NEEDS SERVICE";
        }
        else {
            return "ERROR";
        }
    }

    function getLocation() {return $this->location;}
    function getIPAddress() {return $this->ip_address;}

    function getID() {
        return $this->printer_id;
    }

    function getNonKeyColumns() {
        return array("location", "IPv6", "model", "vendor_ID");
    }
    
    function getPart(string $part_name) {
        foreach ($this->parts as $part) {
            if ($part->part_name === $part_name) {return $part;}
        }
    }

    function setStatus(string $new_status) {
        $this->has_error = false;
        $new_status = strtolower($new_status);
        if ($new_status === "not connected") {
            $this->is_connected = false;
            $this->is_available = false;
        }
        else {
            $this->is_connected = true;
            if($new_status === "available") {
                $this->is_available = true;
                $this->is_busy = false;
                $this->needs_service = false;
            }
            else {
                $this->is_available = false;
                if($new_status === "busy") {
                    $this->is_busy = true;
                    $this->needs_service = false;
                }
                else {
                    $this->is_busy = false;
                    if($new_status === "needs service") {
                        $this->needs_service = true;
                    }
                    else {
                        $this->has_error = true;
                    }
                }
            }
        }
    }

    function setID(int $new_id) {
        $this->printer_id = $new_id;
    }

    function addPart(Part $new_part) {
        array_push($this->parts, $new_part);
    }

    function addMat(Material $new_mat) {
        array_push($this->materials, $new_mat);
    }

    function addMatIDCanPrint(Material $mat_can_print) {
        array_push($this->mats_can_print, $mat_can_print);
    }

    function updatePartIDs() {
        foreach ($this->parts as $part) {
            $part->printer_id = $this->printer_id;
        }
    }

    function toArray() {
        return array($this->location, $this->ip_address, $this->model, $this->vendor->getID());
    }
}
?>