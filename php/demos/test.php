<html>


<?php
    include 'functions.php';
    ?><h1> Example connection1 </h1><?php
    $conn = connectToServer();
    ?><h1> Example connection2 </h1><?php

    $query = 'SELECT * from Mocko_Ex.Course';
    $result = $conn->query($query);

    printf("<h2> Query </h2>");
    printf("<p>".$query."</p>");

    $books = $result->fetch_all(MYSQLI_BOTH);

    printf("<h2> Table Results </h2>");
    $cols = array("c_id", "CourseRubric", "CourseNumber", "CourseName");
    printTable($books, $cols);
    printf("<br>");

    $conn->close();
?>

</html>