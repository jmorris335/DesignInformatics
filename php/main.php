<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>3D Printers Overview</title>
        <link rel="stylesheet" href="../web/css/styles.css">
    </head>
    <body>
        <?php include "../web/nav.php"; printTopNav(); ?>

        <h1> Printer Interface </h1>
        <?php
            include ("SQL_functions.php");
            include ("functions.php");

            $conn = connectToServer(to_print: false);
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

            printf("<table>");
            for ($i = 0; $i < count($printers); $i++) {
                if ($i % 2 === 0) {printf("<tr>");}
                printPrinterCell($printers[$i], $conn);
                if ($i % 2 === 1) {printf("</tr>");}
            }            
            printf("</table");

            function printPrinterCell(array $row, mysqli $conn) {
                $id = $row["printer_ID"];
                $location = $row["location"];
                $model = $row["model"];
                $status = getPrinterStatus($id, $conn);

                printf("<td> <h3>$model</h3>Location: $location<br>");
                $color = "yellow";
                if ($status === "ERROR") {$color = "red";}
                elseif ($status === "AVAILABLE") {$color = "green";}
                printf("Status: <b style=\"color:$color;\"> $status </b></td>");
            }

            $conn->close();
        ?>
        <br>

        <p> Design Informatics, (c) 2023 </p>
    </body>
</html>
