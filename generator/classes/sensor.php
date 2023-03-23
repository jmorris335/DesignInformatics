<?php
class Sensor {
    public int $sensor_id;
    public string $sensor_name;
    public string $unit;
    public array $measurements;
    public int $part_id;

    private float $nominal_value;
    private float $min_value;
    private float $max_value;
    
    function __construct(string $sensor_name, string $unit, float $nominal_value, float $min_value, float $max_value) {
        $this->sensor_name = $sensor_name;
        $this->unit = $unit;
        $this->nominal_value = $nominal_value;
        $this->min_value = $min_value;
        $this->max_value = $max_value;
        $this->measurements = array();
    }

    function addMeasurement(DateTimeImmutable $timestamp, float $value) {
        array_unshift($this->measurements, array($timestamp, $value));
    }

    function setID(int $new_id) {
        $this->sensor_id = $new_id;
    }

    function getID() {
        return $this->sensor_id;
    }

    function getNonKeyColumns() {
        return array("sensor_name", "part_ID");
    }

    function setPartID(int $new_id) {
        $this->part_id = $new_id;
    }

    function getMeasurement(int $order=0) {
        if ($order < 0) {$order = 0;}
        else if($order >= count($this->measurements)) {$order = count($this->measurements) - 1;}
        return $this->measurements[$order];
    }

    function getMeasurements() {
        return $this->measurements;
    }

    function generate(int $n=0, float $seed_value=0) {
        $timestamp = new DateTimeImmutable(date("Y-m-d H:i:s"), new DateTimeZone("America/New_York"));
        if ($n === 0) {
            $n = rand(1, 100);
        }
        $new_value = $seed_value;
        for ($i = 0; $i < $n; $i++) {
            $this->addMeasurement($timestamp, $new_value);

            $new_value = $new_value + rand() / getrandmax();
            // Trend Maker
            if (rand(0, 100) > 90) {
                $new_value = $new_value + $new_value / 3;
            }
            $seconds_between_measurement = rand() / getrandmax();
            $timestamp = $timestamp->add(new DateInterval("PT".$seconds_between_measurement."S"));
        }
    }

    function toArray() {
        return array($this->sensor_name, $this->part_id);
    }
}
?>