<?php

class PrinterState {
    public DateTimeImmutable $timestamp;
    public int $printer_id;    
    public bool $is_busy;
    public bool $is_available;
    public bool $is_connected;
    public bool $needs_service;
    public bool $has_error;

    function __construct(DateTimeImmutable $timestamp, int $printer_id, string $status="available") {
        $this->timestamp = $timestamp;
        $this->printer_id = $printer_id;
        $this->setStatus($status);

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

    function toArray() {
        $con = $this->is_connected ? 1 : 0;
        $bus = $this->is_busy ? 1 : 0;
        $avb = $this->is_available ? 1 : 0;
        $nsv = $this->needs_service ? 1 : 0;
        $err = $this->has_error ? 1 : 0;
        return array($this->printer_id, $this->timestamp, $con, $bus, $avb, $nsv, $err);
    }
}
?>