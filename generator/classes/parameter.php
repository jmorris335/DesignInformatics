<?php
class Parameter {
    public int $param_id;
    public string $param_name;
    public float $value;
    public string $unit; 

    function __construct(string $param_name, float $value, string $unit) {
        $this->param_name = $param_name;
        $this->value = $value;
        $this->unit = $unit;
    }

    function setID(int $new_id) {
        $this->param_id = $new_id;
    }

    function getID() {
        return $this->param_id;
    }

    function getNonKeyColumns() {
        return array("param_name", "value", "unit");
    }

    function toArray() {
        return array($this->param_name, $this->value, $this->unit);
    }
}
?>