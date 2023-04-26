<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Print Report </title>
        <link rel="stylesheet" href="../web/css/styles.css">
    </head>
    <body>
        <?php include "../web/nav.php"; printTopNav(); ?>

        <h1> Create Print Report </h1>
        <?php
            include_once ("functions.php");
            include_once ("SQL_functions.php");
            $conn = connectToServer(to_print: false);
            $conn->query("USE 3DPrinterDT;");

            if (isset($_POST['success'])) {$posted = true; printf("<h3> <b style='color:green;'>Success</b></h3>");}

            $sql_jobs = "SELECT print_job.job_ID, employee.first_name, employee.last_name, printer.printer_name
            FROM print_job, printer, employee
            WHERE print_start_time IS NOT NULL
            AND print_finish_time IS NULL
            AND employee.employee_ID = print_job.designer_ID
            AND printer.printer_ID = print_job.printer_ID
            ;";

            $results = $conn->query($sql_jobs);
            $active_jobs = $results->fetch_all(MYSQLI_BOTH);

            printf("<h1><b style='color:red;'> test </b> </h1>");

            printf("
            <form method='post' action='' target='_self'>
                <div class='row'>
                    <div class='col-25'>
                        <label for='Print Job'>Select Print Job</label>
                    </div>
                    <div class='col-75'>
                        <select id='print_job' name='print_job'>
                            <option value='' disabled selected>Select...</option>");
                            foreach ($active_jobs as $job) {
                                printf("<option value=$job[0]>");
                                
                                $bool = true;
                                $second = true;
                                foreach($job as $att) {
                                    if ($bool) {
                                        printf($att);
                                        $bool = false;
                                    } elseif ($second) {
                                        $second = false;
                                    } else {
                                    printf(" - ".$att);
                                    $second = true;
                                    }
                                }
                                
                                printf("</option>");
                            }
            ?>
                        </select>
                    </div>
                </div>
                <div class='row'>
                    <input type='radio' id='success' name='print_status' value='Success'>
                    <label for='success'>Success</label>
                    <input type='radio' id='failed' name='print_status' value='Failed'>
                    <label for='failed'>Failed</label>
                    <input type='radio' id='cancelled' name='print_status' value='Cancelled'>
                    <label for='cancelled'>Cancelled</label>
                </div>
                <div class='row'>
                    <div class='col-25'>
                        <label for='comments'>Comments: </label>
                    </div>
                    <div class='col-75'>
                        <textarea id='comments' name='comments' rows='7' cols='50' maxlength=255></textarea>
                    </div>
                </div>
                <div class='row'>
                    <input type='checkbox' id='maint' name='maint' value='maint'>
                    <label for='maint'>Maintenance Required</label>
                </div>
                <div class='row'>
                    <input type='checkbox' id='queue' name='queue' value='queue' checked>
                    <label for='queue'>Auto-queue next print job</label>
                </div>
                <div class='submit-row'>
                    <input type='submit' value='Submit'>
                    <input type='reset' value='Reset'>
                </div>
                <input type='hidden' name='success' id='success' value='Success'>
            </form>
            
            <?php
                if ($posted) {
                    $job_ID = $_POST['print_job'];
                    $print_status = $_POST['print_status'];
                    $comments = $_POST['comments'];
                    $maint = $_POST['maint'] == 'maint';
                    $queue = $post['queue'] == 'queue';

                    $job_update = "UPDATE print_job
                    SET in_queue = 0, 
                    job_succeeded = ".$print_status.", 
                    print_finish_time = GETDATE(), 
                    print_report = ".$comments." 
                    WHERE job_ID = ".$job_ID.";";
                    
                    $results = $conn-> query($job_update);
                    printf("<p>".$results."</p>");

                    $get_printer = "SELECT printer_ID
                    FROM print_job 
                    WHERE job_ID = ".$job_ID.";";
                    $results = $conn-> query($get_printer);
                    $printer_ID = $results->fetch_all(MYSQLI_BOTH);

                    if ($maint) {
                        $sql_maint = "UPDATE printer_state
                        SET is_available = false, 
                        timestamp = GETDATE(), 
                        needs_sevice = true 
                        WHERE printer_state.printer_ID = ".$printer_ID." 
                        ;";

                        $results = $conn-> query($sql_maint);
                        printf("<p>".$results."</p>");
                    } elseif ($queue) {
                        $sql_queue = "
                        UPDATE print_job, printer_state
                        SET 
                        
                        ;";

                    } else {
                        $sql_available = "
                        UPDATE printer_state
                        SET is_busy = false,
                        is_available = true
                        WHERE printer_state.printer_ID = ".$printer_ID."
                        
                        ;";
                    }




                }



            $conn->close();
            ?>
    

    




    
            <p> Design Informatics, (c) 2023 </p>
        </body>
    </html>