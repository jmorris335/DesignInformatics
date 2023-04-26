<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Printer Details</title>
        <link rel="stylesheet" href="../web/css/styles.css">
    </head>
    <body>
    <?php include "../web/nav.php"; printTopNav(); ?>

        <h1> Printer Details </h1> <!--Page to show details about a specific printer -->
        <?php
            include ("SQL_functions.php");
            include ("functions.php");

            $conn = connectToServer(to_print: false);
            $conn->query("USE 3DPrinterDT;");

            $printers = getTable("Printer", $conn);

            if (isset($_POST['printer_ID'])) {
                $printer = $_POST['printer_ID'];
                $printer_name = $_POST['printer_name'];
                printf("<h2>".$printer_name."</h2>");
            }
            else {$printer = 1; $printer_name = "Printer Not Found";printf("<h3>".$printer_name."</h3>");}
            

            $sql_job = "SELECT print_job.job_ID, print_job.print_start_time
            FROM print_job
            WHERE print_job.printer_ID = ".$printer." 
            AND print_job.print_start_time IS NOT NULL
            AND print_job.print_finish_time IS NULL
            ;";

            $sql_printer = "SELECT printer.model, printer.location, vendor.vendor_name
            FROM printer, vendor
            WHERE printer.printer_ID = ".$printer." 
            AND printer.vendor_ID = vendor.vendor_ID
            ;";

            $sql_printer_full = "SELECT printer.model, printer.location, 
            vendor.vendor_name, print_job.job_ID, print_job.print_start_time
            FROM printer, vendor, print_job 
            WHERE printer.printer_ID = ".$printer." 
            AND print_job.printer_ID = ".$printer." 
            AND print_job.print_start_time IS NOT NULL
            AND print_job.print_finish_time IS NULL
            AND printer.vendor_ID = vendor.vendor_ID
            ;";

            $sql_material = "SELECT Material.mat_name, Material.color, Vendor.vendor_name, 
            Material_Loaded_In_Printer.volume
            FROM Material_Loaded_In_Printer, Material, Vendor
            WHERE Material.vendor_ID = Vendor.vendor_ID
            AND Material_Loaded_In_Printer.printer_ID = ".$printer."
            AND Material_Loaded_In_Printer.mat_ID = Material.mat_ID
            ;";


            $status = getPrinterStatus($printer, $conn);
            $color = "orange";
            if ($status === "ERROR") {$color = "red";}
            elseif ($status === "AVAILABLE") {$color = "green";}
            printf("<h3>Status: <b style=\"color:$color;\"> $status </b></h3>");

            //Print Job Table
            $results = $conn->query($sql_printer);
            $printer_results = $results->fetch_all(MYSQLI_BOTH);

            $results = $conn->query($sql_job);
            $job_results = $results->fetch_all(MYSQLI_BOTH);

            $results = $conn->query($sql_printer_full);
            $printer_results_full = $results->fetch_all(MYSQLI_BOTH);

            $cols = array("Model", "Printer Location", "Printer Manufacturer", 
            "Current Print Job ID", "Job Start Time");
            if (count($job_results) == 0) {
                printTable($printer_results, array_slice($cols, 0, 2));
            } else {
                printTable($printer_results_full, array_slice($cols, 0, 3));
            }

            //Materials Table
            $results = $conn->query($sql_material);
            $mat_results = $results->fetch_all(MYSQLI_BOTH);
            $cols = array("Material Name", "Material Color", "Material Vendor", "Volume Remaining");

            printf("<h3> Materials Loaded in Printer </h3>");

            printTable($mat_results, $cols);


            printf("<br>");


            $conn->close();
        ?>
        <div style="float:left;">
            <form method = 'post' action ="print_jobs.php">
                <input type="hidden" name="printer_ID" id="printer_ID" value="<?php printf($printer) ?>">
                <input type="hidden" name="printer_name" id="printer_name" value="<?php printf($printer_name) ?>">
                <input type = "submit" value="Print Jobs">
            </form>
        </div>  
        <div style="float:left;">
            <form method = 'post' action ="maintenance_log.php">
                <input type="hidden" name="printer_ID" id="printer_ID" value="<?php printf($printer) ?>">
                <input type="hidden" name="printer_name" id="printer_name" value="<?php printf($printer_name) ?>">
                <input type="submit" value="Maintenance Log">
            </form>
        </div>

        <br>
        <br>
        <br>
        <p> Design Informatics, (c) 2023 </p>
     </body>
</html>