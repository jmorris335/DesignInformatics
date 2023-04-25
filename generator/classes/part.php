<?php
include_once "parameter.php";
include_once "vendor.php";
include_once "sensor.php";


class Part {
    public int $part_id;
    public string $part_name;
    public Vendor $vendor;
    public array $params;
    public array $sensors;
    public int $printer_id;

    function __construct(string $part_name, Vendor $vendor) {
        $this->part_name = $part_name;
        $this->vendor = $vendor;
        $this->params = array();
        $this->sensors = array();
    }

    // Getters
    function getSensor(string $sensor_name) {
        foreach ($this->sensors as $sensor) {
            if ($sensor->sensor_name === $sensor_name) {return $sensor;}
        }
    }

    function getID() {
        return $this->part_id;
    }

    function getNonKeyColumns() {
        return array("part_name", "vendor_ID", "printer_ID");
    }

    // Setters
    function setID(int $new_id) {
        $this->part_id = $new_id;
    }

    function setPrinterID(int $new_id) {
        $this->printer_id = $new_id;
    }

    /**
     * @param array $new_param_info = pair where first term is a Parameter and second is a value
     */
    function addParam(array $new_param_info) {
        array_push($this->params, $new_param_info);
    }

    function addSensor(Sensor $new_sensor) {
        array_push($this->sensors, $new_sensor);
    }

    function updateSensorIDs() {
        foreach ($this->sensors as $sensor) {
            $sensor->part_id = $this->part_id;
        }
    }

    function toArray() {
        return array($this->part_name, $this->vendor->getID(), $this->printer_id);
    }
}
?>