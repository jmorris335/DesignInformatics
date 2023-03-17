<?php
class Sensor {
    public string $name;
    public int $printer_id;
    public string $measured_part;
    public string $unit;
    public array $measurements;
    
    function __construct(string $name, int $printer_id, string $measured_part, string $unit) {
        $this->name = $name;
        $this->printer_id = $printer_id;
        $this->measured_part = $measured_part;
        $this->unit = $unit;
        $this->measurements = array();
    }

    function addMeasurement(string $timestamp, float $value) {
        array_unshift($this->measurements, array($timestamp, $value));
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
}
?>