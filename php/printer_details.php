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

            $printer = 1; //htmlspecialchars($_POST['printer_ID']); //variable name may change, check with john on printer status page


            $sql_printJob = "SELECT printer.printer_ID, printer.printer_name, printer.location, 
            vendor.vendor_name, print_job.job_ID, print_job.job_succeeded, print_job.in_queue, 
            printer_state.is_connected, printer_state.is_busy, printer_state.is_available, 
            printer_state.needs_service, printer_state.has_error
            FROM printer, printer_state, vendor, print_job 
            WHERE printer.printer_ID = ".$printer." 
            AND printer_state.printer_ID = ".$printer." 
            AND print_job.printer_ID = ".$printer." 
            AND print_job.in_queue = 1 
            AND printer.vendor_ID = vendor.vendor_ID;";

            $sql_material = "SELECT Material.mat_name, Material.color, Vendor.vendor_name, 
            Material_Loaded_In_Printer.volume
            FROM Material_Loaded_In_Printer, Material, Vendor
            WHERE Material.vendor_ID = Vendor.vendor_ID
            AND Material_Loaded_In_Printer.printer_ID = ".$printer."
            AND Material_Loaded_In_Printer.mat_ID = Material.mat_ID
            ;";

            //Print Job Table
            $results = $conn->query($sql_printJob);
            $job_results = $results->fetch_all(MYSQLI_BOTH);
            $cols = array("Printer ID", "Printer Name", "Printer Location", "Printer Manufacturer", 
            "Print Job ID", "Job Completion", "Job Queue Status", "Connection Status", "Busy Status", 
            "Printer Availability", "Needs Maintenance", "Error Status");

            printTable($job_results, $cols);

            //Materials Table
            $results = $conn->query($sql_material);
            $mat_results = $results->fetch_all(MYSQLI_BOTH);
            $cols = array("Material Name", "Material Color", "Material Vendor", "Volume Remaining");

            printf("<h3> Materials Loaded in Printer </h3>");

            printTable($mat_results, $cols);


            printf("<br>");


            $conn->close();
        ?>
        
        <p> Design Informatics, (c) 2023 </p>
     </body>
</html>