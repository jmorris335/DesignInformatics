<?php
include_once ("vendor.php");
class Material {
    public int $mat_id;
    public string $mat_name;
    public float $melt_temp;
    public string $color;
    public Vendor $vendor;

    function __construct(string $mat_name, float $melt_temp, string $color, Vendor $vendor) {
        $this->mat_name = $mat_name;
        $this->melt_temp = $melt_temp;
        $this->color = $color;
        $this->vendor = $vendor;
    }

    function getID() {
        return $this->mat_id;
    }

    function getNonKeyColumns() {
        return array("melt_temp, mat_name, color, vendor_id");
    }

    function setID(int $new_id) {
        $this->mat_id = $new_id;
    }

    function toArray() {
        return array($this->melt_temp, $this->mat_name, $this->color, $this->vendor->vendor_id);
    }
}
?>