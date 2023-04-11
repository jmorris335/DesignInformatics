<?php
include_once "part.php";
include_once "material.php";
include_once "vendor.php";
include_once "printer_state.php";
include_once "loaded_mats.php";

class Printer {
    public int $printer_id;
    public string $location;
    public string $ip_address;
    public string $model;
    public string $printer_name;
    public Vendor $vendor;

    public array $parts;
    public array $mats_loaded;
    public array $mats_can_print;
    public array $statuses;

    function __construct(string $location, string $ip_address, string $model, string $name, Vendor $vendor) {
        $this->location = $location;
        $this->ip_address = $ip_address;
        $this->model = $model;
        $this->printer_name = $name;
        $this->vendor = $vendor;
        $this->parts = array();
        $this->mats_loaded = array();
        $this->mats_can_print = array();
        $this->statuses = array();
    }

    function getLocation() {return $this->location;}
    function getIPAddress() {return $this->ip_address;}
    function getName() {return $this->printer_name;}

    function getID() {
        return $this->printer_id;
    }

    function getNonKeyColumns() {
        return array("printer_name", "location", "IPv6", "model", "vendor_ID");
    }
    
    function getPart(string $part_name) {
        foreach ($this->parts as $part) {
            if ($part->part_name === $part_name) {return $part;}
        }
    }

    function getStatus() {
        $length = count($this->statuses);
        if ($length === 0) {return null;}
        else {
            return $this->statuses[$length - 1];
        }
    }

    function setID(int $new_id) {
        $this->printer_id = $new_id;
    }

    function setStatus(DateTimeImmutable $timestamp, string $status="available") {
        array_push($this->statuses, new PrinterState($timestamp, $this->getID(), $status));
    }

    function addPart(Part $new_part) {
        array_push($this->parts, $new_part);
    }

    function addMat(int $mat_id,  DateTimeImmutable $timestamp, float $volume=0) {
        array_push($this->mats_loaded, new LoadedMats($this->getID(), $mat_id, $timestamp, $volume));
    }

    function addMatIDCanPrint(int $mat_id_can_print) {
        array_push($this->mats_can_print, $mat_id_can_print);
    }

    function updatePartIDs() {
        foreach ($this->parts as $part) {
            $part->printer_id = $this->printer_id;
        }
    }

    function toArray() {
        return array($this->printer_name, $this->location, $this->ip_address, $this->model, $this->vendor->getID());
    }
}
?>