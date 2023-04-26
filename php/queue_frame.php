<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Printer Queue</title>
    <link rel="stylesheet" href="../web/css/styles.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="../web/js/app.js"></script>
</head>
<body>
    <!-- <?php include "../web/nav.php"; printTopNav(); ?> -->

    <?php
        include_once ("functions.php");
        include_once ("SQL_functions.php");
        $conn = connectToServer(to_print: false);
        $conn->query("USE 3DPrinterDT;");

        if (!empty($_POST["printer_ID"])) {$printer_ID = $_POST["printer_ID"];}
        else {
            $printer_ID = getTable("Printer", $conn)[0][0];
        }

        $queue = getPrinterQueue($printer_ID, $conn);
        $data = formatQueue($queue, $conn);
        if (empty($data)) {
            printf("Queue is empty");
            $columns = array();
        }
        else {
            printf("<h3> Printer $printer_ID Queue </h3>");
            $columns = array_keys($data[0]);
        }

        printf("<table>");
        for ($i = 0; $i < count($columns); $i++) {
            printf("<th>%s</th>\n", $columns[$i]);
        }
        foreach($data as $row) {
            printf("<tr>\n");
            for ($i = 0; $i < count($columns); $i++) {
                printf("<td>%s</td>\n", $row[$columns[$i]]);
            }
            printf("</tr>\n");
        }
        printf("</table>\n");

        function formatQueue(array $queue, mysqli $conn) {
            // Finds more human readable values for the values in the array. 
            $out = array();
            foreach ($queue as $job) {
                $fn = getValues("Employee", "first_name", "employee_ID", $job["designer_ID"], $conn)[0][0];
                $ln = getValues("Employee", "last_name", "employee_ID", $job["designer_ID"], $conn)[0][0];
                $out_row["Designer"] = "$fn $ln";
                $out_row["Material"] = getValues("Material", "mat_name", "mat_ID", $job["mat_ID"], $conn)[0][0];
                $out_row["Print Volume"] = $job["print_volume"];
                $out_row["Submission Time"] = is_null($job["submission_time"]) ? "N/A" : formatTimestamp(($job["submission_time"]));
                $out_row["Start Time"] = is_null($job["print_start_time"]) ? "N/A" : formatTimestamp(($job["print_start_time"]));
                $out_row["Finish Time"] = is_null($job["print_finish_time"]) ? "N/A" : formatTimestamp(($job["print_finish_time"]));
                array_push($out, $out_row);
            }
            return $out;
        }

        $conn->close();
    ?>
</body>
</html>