<html>
    <head>
        <link rel="stylesheet" href="../web/styles.css">
    </head>
    <body>
        <h1> Printer Interface </h1>
        <h3> Design Informatics, (c) 2023 </h3>

        <p> Note, links require the localhost port to be set to 8888. See the README.md file for more information</p>

        <h2> Printers </h2>
        <?php
            include "printer.php";
            $printers = array();
            //TODO: Replace this random creation with a DB pull
            array_push($printers, new printer(1, "By the water cooler", "2001:db8::8a2e:370:7334"));
            array_push($printers, new printer(2, "By Alice's office", "2001:de8::8a2e:370:7334"));

            foreach ($printers as $printer) {
                printf("<h3> Printer: $printer->printer_id </h3>");
                $status = $printer->getStatus();
                printf("<p> Status: $status </p> <br>");
            }
        ?>
        <br>
    </body>

</html>
