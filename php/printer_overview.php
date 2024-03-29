<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Printers Overview</title>
        <link rel="stylesheet" href="../web/css/styles.css">
        <script src="../web/js/app.js"></script>
    </head>
    <body>
        <?php include "../web/nav.php"; printTopNav(); ?>

        <h1> Printer Interface </h1>
        <?php
            include ("SQL_functions.php");
            include ("functions.php");
            include ("../generator/printer_functionality.php");

            $conn = connectToServer(to_print: false);
            $conn->query("USE 3DPrinterDT;");

            //Handle submitted parts
            if (isset($_POST['job_id'])) {
                $job_id = $_POST['job_id'];
                addToQueue($job_id, $conn);
            }

            processQueue($conn);
            $conn->refresh(MYSQLI_REFRESH_TABLES);
            $printers = getTable("Printer", $conn);

            printf("<style>
            table, th, td {
                border-collapse: collapse;
                margin-left: auto;
                margin-right: auto;
            }
            th, td {
                text-align: left;
                padding: 5px;
                padding-right: 50px;
            }
            </style>");

            printf("\n<table>");
            for ($i = 0; $i < count($printers); $i++) {
                if ($i % 2 === 0) {printf("<tr>");}
                printPrinterCell($printers[$i], $conn, $i);
                if ($i % 2 === 1) {printf("</tr>");}
            }            
            printf("\n</table>");

            function printPrinterCell(array $row, mysqli $conn, int $media_index=0) {
                $printer_name = $row["printer_name"];
                $id = $row["printer_ID"];
                $location = $row["location"];
                $name = $row["printer_name"];
                $media = array("../web/media/f123-fdm-3d-printer.jpeg", 
                                "../web/media/f900-3d-printer.png",
                                "../web/media/f770-3d-printer.png");
                $image = $media[$media_index % count($media)];
                $status = getPrinterStatus($id, $conn);
                $queue_length = count(getPrinterQueue($id, $conn));

                printf("\n\t<td>\n\t<h3>$name</h3>
                        \t<img src=\"$image\" style=\"height:200px;\"><br>");
                $color = "orange";
                if ($status === "ERROR") {$color = "red";}
                elseif ($status === "AVAILABLE") {$color = "green";}
                printf("\n\tStatus: <b style=\"color:$color;\"> $status </b>");
                printf("<br>
                    <form method=\"post\" action=\"queue_frame.php\" target=\"queue_box\">
                        <input type=\"hidden\" name=\"printer_ID\" id=\"printer_ID\" value=\"$id\">
                        <input type=\"submit\" onclick=\"displayQueue()\" value=\"Queue: $queue_length\" style=\"width:100%%;padding:3px\">
                    </form>
                    <form method=\"post\" action=\"printer_details.php\">
                    <input type=\"hidden\" name=\"printer_ID\" id=\"printer_ID\" value=\"$id\">
                    <input type=\"hidden\" name=\"printer_name\" id=\"printer_name\" value=\"$printer_name\">
                    <input type=\"submit\" value=\"Printer Details\" style=\"width:100%%;padding:3px\">
                    </form>
                </td>");
            }
        ?>

        <iframe class="queue_frame" id="queue_box" name="queue_box" src="queue_frame.php"> </iframe> 

        <script>
            function displayQueue() {
                el = document.getElementById("queue_box");
                if (el.style.display === "block") {el.style.display = "none";}
                else {el.style.display = "block";} 
            }
        </script>

        <?php
            $conn->close();
        ?>

        <br>
        <p> Design Informatics, (c) 2023 </p>
    </body>
</html>
