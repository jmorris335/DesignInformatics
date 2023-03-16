<html>
    <head>
        <link rel="stylesheet" href="../../web/styles.css">
    </head>
    <body>
        <?php
        // Connect to server
        include '../functions.php';
        $conn = connectToServer(to_print: false);
        printf("<h2> Form Results </h2>");

        // Print the received string
        $course_id = $_POST["course_id"];
        printf("<h3> Search Term: $course_id </h3>");

        // Compose and print the query
        $conn->query("USE Mocko_Ex;"); //Select which db to use
        $query = "SELECT Book.Title AS Title,
            Course.CourseName AS CourseName
        FROM Course, Book, Course_uses_Book
        WHERE Course.c_id = Course_uses_Book.Course_ID
            AND Book.b_id = Course_uses_Book.Book_ID
            AND Course_uses_Book.Course_ID = $course_id;";        
        printf("<h3> Query </h3>");
        printf("<p>$query</p>");
        
        // Execute the query and print results
        $result = $conn->query($query);
        if (!$result) {
            printf("<h3> Query Failed </h3>");
        }
        else {
            $table = $result->fetch_all(MYSQLI_BOTH);
            printf("<h3> Query Results </h3>");
            $cols = array("CourseName", "Title");
            printTable($table, $cols);
            printf("<br>");
        }
        ?>
    </body>
</html>