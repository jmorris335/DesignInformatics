<?php
class Parameter {
    public int $param_id;
    public string $param_name;
    public string $unit; 

    function __construct(string $param_name, string $unit) {
        $this->param_name = $param_name;
        $this->unit = $unit;
    }

    function setID(int $new_id) {
        $this->param_id = $new_id;
    }

    function getID() {
        return $this->param_id;
    }

    function getNonKeyColumns() {
        return array("param_name", "unit");
    }

    function toArray() {
        return array($this->param_name, $this->unit);
    }
}
?>