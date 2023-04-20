<?php
include_once ("../php/functions.php");
include_once ("../php/SQL_functions.php");

//TESTING
$conn = connectToServer(to_print: False);
$conn->query("USE 3DPrinterDT;");
processQueue($conn);

/**
 * Put submission time as current time and place job in queue
 * 
 * @param string $job_id PK for Print_Job entity to update
 * @param mysqli $conn Connection to the DB
 */
function addToQueue(string $job_id, mysqli $conn) {
    $update_cols = array("submission_time", "in_queue");
    $update_vals = array(new DateTime("now"), "1");
    $query = makeUpdateQuery("Print_Job", $update_cols, $update_vals, 
                    array("job_id"), array($job_id));
    $conn->query($query);
}

/**
 * Processes the Queue, doing the following actions for each printer in the DB:
 * 1. Checks if the printer is currently printing.
 * 2. If printer is printing, checks if the current job is finished
 * 3. If the the current job is finished, the function completes the job and clears the printer
 * 4. If the printer is cleared, takes the oldest Print_Job in the queue and sends it to the printer
 * If none of these conditions are met, then the function does nothing.
 * 
 * @param mysqli $conn Connection to the DB
 */
function processQueue(mysqli $conn) {
    $printers = getTable("Printer", $conn);
    $jobs_finished = True;
    foreach ($printers as $printer) {
        $printer_id = $printer['printer_ID'];
        if (isPrinting($printer_id, $conn)) {
            $jobs = getCurrentPrintJob($printer_id, $conn);
            print_r($jobs);
            foreach ($jobs as $job) {
                if (isJobFinished($job)) {
                    completeJob($printer_id, $job['job_ID'], $conn);
                }
                else {
                    $jobs_finished = False;
                }
            }
        }
        if ($jobs_finished) {
            $queue = getPrinterQueue($printer_id, $conn);
            if (!empty($queue)) {
                printNextJob($printer_id, $queue, $conn);
            }
        }
    }
}

/**
 * Prints the next job in the queue
 * 
 * @param string $printer_id PK for the Printer to print with
 * @param array $queue 2D array where each row is a print job to print, ordered by submission date
 * @param mysqli $conn Connection to the DB
 */
function printNextJob(string $printer_id, array $queue, mysqli $conn) {
    if (isPrinting($printer_id, $conn)) {return;}
    $job_id = $queue[0]['job_ID'];
    $update_cols = array("print_start_time", "in_queue");
    $date = new DateTime("now");
    $update_vals = array($date->format("Ymd"), "0");
    $query = makeUpdateQuery("Print_Job", $update_cols, $update_vals, 
                    array("job_id"), array($job_id));
    $conn->query($query);
    setPrinterStatus($printer_id, "BUSY", $conn);
}

/**
 * Update a print job after it is finished printing
 * 
 * @param string $job_id PK for Print_Job entity to update
 * @param mysqli $conn Connection to the DB
 * @param int $printer_success_rate=90 The percentage of jobs successfully completed by the printer
 */
function completeJob(string $printer_id, string $job_id, mysqli $conn, int $printer_success_rate = 90) {
    $job_succeeded = rand(0, 100) < $printer_success_rate;
    $update_cols = array("print_finish_time", "job_succeeded", "in_queue");
    $update_vals = array(new DateTime("now"),$job_succeeded, "0");
    $query = makeUpdateQuery("Print_Job", $update_cols, $update_vals, 
                    array("job_id"), array($job_id));
    $conn->query($query);
    setPrinterStatus($printer_id, "AVAILABLE", $conn);
}

/**
 * Returns true if the specified print_job is done printing.
 * @param array $job array with key 'print_start_time' mapping to a DateTime timestamp
 * @return bool True if the current time is greater than the job's start time plus some arbitrary print duraiton.
 *              False otherwise, or if job doesn't have key "print_start_time", or value is null
 */
function isJobFinished(array $job) {
    if (!isset($job['print_start_time']) || is_null($job['print_start_time'])) {return False;}
    $rand_finish_time = new DateTimeImmutable($job['print_start_time']);
    $rand_finish_time = $rand_finish_time->add(getRandomTimeDuration());
    return (new DateTimeImmutable("now") >= $rand_finish_time);
}

/**
 * Checks if the printer is printing
 * 
 * @param string $job_id PK for Print_Job entity to update
 * @param mysqli $conn Connection to the DB
 * @return bool False if the printer is not currently printing a job
 */
function isPrinting(string $printer_id, mysqli $conn) {
    if (getPrinterStatus($printer_id, $conn) != "BUSY") {return False;}
    $current_jobs = getCurrentPrintJob($printer_id, $conn);
    if (empty($current_jobs)) {return False;}
    else {return True;}
}

/**
 * Returns a time duration (psuedo-random)
 * @return DateInterval the time duration
 */
function getRandomTimeDuration(): DateInterval {
    return DateInterval::createFromDateString("15 seconds");
}








?>