<?php
class JobParameter {
    public int $jobparam_id;
    public string $jobparam_name;
    public string $unit; 

    function __construct(string $jobparam_name, string $unit) {
        $this->jobparam_name = $jobparam_name;
        $this->unit = $unit;
    }

    function setID(int $new_id) {
        $this->jobparam_id = $new_id;
    }

    function getID() {
        return $this->jobparam_id;
    }

    function getNonKeyColumns() {
        return array("jobparam_name", "unit");
    }

    function toArray() {
        return array($this->jobparam_name, $this->unit);
    }
}
?>