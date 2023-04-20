<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Print Jobs</title>
        <link rel="stylesheet" href="../web/css/styles.css">
    </head>
    <body>
    <?php include "../web/nav.php"; printTopNav(); ?>

        <h1> Print Jobs </h1> <!--All the print jobs assigned to the given printer -->
        <?php
            include ("SQL_functions.php");
            include ("functions.php");

            $conn = connectToServer(to_print: false);
            $conn->query("USE 3DPrinterDT;");

            if (isset($_POST['printer_ID'])) {$printer = $_POST['printer_ID'];}
            else {$printer = 1;}

            $query_job = "SELECT print_job.job_ID, material.mat_name, employee.first_name, employee.last_name, 
            print_job.job_succeeded, print_job.submission_time as subTime, print_job.print_start_time, 
            print_job.print_finish_time, print_job.print_volume
            FROM print_job, material, employee
            WHERE print_job.printer_ID = ".$printer." 
            AND print_job.mat_ID = material.mat_ID
            AND print_job.designer_ID = employee_ID
            ORDER BY subTime DESC
            ;";



            $results = $conn->query($query_job);
            $job_results = $results->fetch_all(MYSQLI_BOTH);

            foreach ($job_results as $row) {
                if ($row[4] == 1) {
                    $row[4] = "Success";
                } else {
                    $row[4] = "Fail";
                }
            }

            $cols = array("Job ID", "Material", "First Name", "Last Name", "Success", "Submission Time", 
            "Print Start Time", "Print Finish Time", "Print Volume");

            printTable($job_results, $cols);
            


            $conn->close();
            ?>
            
            <p> Design Informatics, (c) 2023 </p>
         </body>
    </html>