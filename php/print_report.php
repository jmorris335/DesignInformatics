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

            if (isset($_POST['success'])) {printf("<h3>".$_POST."</h3>");}

            $sql_jobs = "SELECT print_job.job_ID, employee.first_name, employee.last_name, printer.printer_name
            FROM print_job, printer, employee
            WHERE print_start_time IS NOT NULL
            AND print_finish_time IS NULL
            AND employee.employee_ID = print_job.designer_ID
            AND printer.printer_ID = print_job.printer_ID
            ;";

            $results = $conn->query($sql_jobs);
            $active_jobs = $results->fetch_all(MYSQLI_BOTH);

            printf("<p> test </p>");

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
            printf("
                        </select>
                    </div>
                </div>
            ");





            $conn->close();
            ?>
    
    
            <p> Design Informatics, (c) 2023 </p>
        </body>
    </html>