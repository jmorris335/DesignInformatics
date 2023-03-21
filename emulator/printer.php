<?php
include "sensor.php";

class Printer {
    public bool $is_busy;
    public bool $is_available;
    public bool $is_connected;
    public bool $needs_service;
    public bool $has_error;

    public int $printer_id;
    public string $location;
    public string $ip_address;

    public array $sensors;

    function __construct(int $printer_id, string $location, string $ip_address) {
        $this->printer_id = $printer_id;
        $this->location = $location;
        $this->ip_address = $ip_address;
        $this->setStatus("available");
        $this->sensors = array();
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

    function addSensor(Sensor $new_sensor) {
        array_push($this->sensors, $new_sensor);
    }
}
?>