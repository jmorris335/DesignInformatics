<?php
    include '../php/functions.php';
    function getDumpFile(string $database, string $filename = 'db_dump.sql') {
        $db = connectToServer();
        $query = "SELECT * INTO OUTFILE ".$filename." FROM ".$database;
        $db->query($query);
        echo("Completed");
        $db->close();
    }

    getDumpFile("Mocko_Ex", "Mocko_Ex_Dump.sql");
?>