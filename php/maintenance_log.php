<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Maintenance Log</title>
        <link rel="stylesheet" href="../web/css/styles.css">
    </head>
    <body>
    <?php include "../web/nav.php"; printTopNav(); ?>

        <h1> Maintenance Log </h1> <!--The Maintenance Log for a given printer -->
        <?php
            include ("SQL_functions.php");
            include ("functions.php");

            $conn = connectToServer(to_print: false);
            $conn->query("USE 3DPrinterDT;");

            if (isset($_POST['printer_ID'])) {
                $printer = $_POST['printer_ID'];
                $printer_name = $_POST['printer_name'];
                printf("<h2>".$printer_name."</h2>");
            }
            else {$printer = 1; $printer_name = "Printers Not Found";printf("<h3>".$printer_name."</h3>");}

            $query_log = "SELECT maintenance_log.timestamp, part.part_name, employee.first_name, employee.last_name, maintenance_log.notes
            FROM maintenance_log, employee, part, part_has_maintenance_log
            WHERE part.printer_ID = $printer
            AND part.part_ID = part_has_maintenance_log.part_ID 
            AND part_has_maintenance_log.mlog_ID = maintenance_log.mlog_ID 
            AND maintenance_log.employee_ID = employee.employee_ID
            ORDER BY maintenance_log.timestamp DESC
            ;";

            $results = $conn->query($query_log);
            $log_results = $results->fetch_all(MYSQLI_BOTH);
            $cols = array("Time", "Part", "First Name", "Last Name", "Comments");

            printTable($log_results, $cols);
            


            $conn->close();
            ?>
            
            <p> Design Informatics, (c) 2023 </p>
         </body>
    </html>