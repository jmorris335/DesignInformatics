<html>
<h1> You can debug things in this file, everything here can be deleted </h1>

<?php
    include '../functions.php';
    $conn = connectToServer();

    $query = "SHOW INDEX FROM 3DPrinterDT.Part_has_Sensor WHERE Key_name = 'PRIMARY';";
    $result = $conn->query($query);

    printf("<h2> Query </h2>");
    printf("<p>".$query."</p>");

    $table = $result->fetch_all(MYSQLI_BOTH);

    printf("<h2> Table Results </h2>");
    $cols = array("Seq_in_index", "Column_name");
    printTable($table, $cols);
    printf("<br>");

    $conn->close();
?>

</html>