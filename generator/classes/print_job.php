<?php
class PrintJob {
    public int $job_id;
    public int $designer_id;
    public int $printer_id;
    public int $mat_id;
    public string $model_code;
    public string $gcode_code;
    public int $preparer_id;
    public int $curator_id;
    public bool $job_succeeded;
    public bool $in_queue;
    public float $print_volume;

    function __construct(int $designer_id, int $printer_id, int $mat_id,
                         string $model_code, string $gcode_code,
                         int $preparer_id= null, int $curator_id= null, 
                         bool $job_succeeded=FALSE, bool $in_queue=FALSE, float $print_volume=0) {
        
        if (is_null($designer_id)) {$this->designer_id = $this->getRandomID();}
        else {$this->designer_id = $designer_id;}
        $this->printer_id = $printer_id;
        $this->mat_id = $mat_id;
        $this->model_code = $model_code;
        $this->gcode_code = $gcode_code;
        if (is_null($preparer_id)) {$this->preparer_id = $this->getRandomID();}
        else {$this->preparer_id = $preparer_id;}
        if (is_null($curator_id)) {$this->curator_id = $this->getRandomID();}
        else {$this->curator_id = $curator_id;}                    
        $this->job_succeeded = $job_succeeded;
        $this->in_queue = $in_queue;
        if ($print_volume == 0) {$this->print_volume = rand(0, 3000) * 1.34;}
        $this->print_volume = $print_volume;
    }

    function setID(int $new_id) {
        $this->job_id = $new_id;
    }

    function getID() {
        return $this->job_id;
    }

    function getRandomID(): int {
        return rand(1, 5);
    }

    function getCurrentTime(): DateTime {
        return new DateTime("now");
    }

    function getNonKeyColumns() {
        return array("designer_ID", "curator_ID", "preparer_ID", "printer_ID", "mat_ID",
                     "model", "code",
                     "job_succeeded", "in_queue", "print_volume");
    }

    function toArray() {
        return array($this->designer_id, $this->curator_id, $this->preparer_id, $this->printer_id, $this->mat_id,
                     $this->model_code, $this->gcode_code,
                     $this->job_succeeded ? 1 : 0, $this->in_queue ? 1 : 0, $this->print_volume);
    }
}
?>