<?php

class LoadedMats {
    public int $printer_id;  
    public int $mat_id;
    public DateTimeImmutable $timestamp;  
    public float $volume; //cm^3, I found some values for 1000-1500 per spool.

    function __construct(int $printer_id, int $mat_id, DateTimeImmutable $timestamp, float $volume) {
        $this->printer_id = $printer_id;
        $this->mat_id = $mat_id;
        $this->timestamp = $timestamp;
        $this->volume = $volume;
    }

    function toArray() {
        return array($this->printer_id, $this->mat_id, $this->timestamp, $this->volume);
    }
}
?>