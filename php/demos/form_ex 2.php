<html>
    <head>
        <link rel="stylesheet" href="../../web/styles.css">
    </head>
    <body>
        <h1> Extended Form Demonstration </h1>
        <p> 15 Mar 2023 </p>

        <h2> PHP Form Example </h2>
        <form method="post" target="_self">
            <!--action attribute ommited to return results to same page-->
            <p> Enter the first name of the student to see all courses they are enrolled in: </p>
            <label for="fname">First name:</label><br>
            <input type="text" id="fname" name="fname"><br>
            <br>
            <input type="submit" value="Submit">
            <input type="reset" value="Reset">
        </form> 

        <form action="form_ex_2_recieve.php" method="post">
            <?php
                // Connect to server
                include '../functions.php';
                $conn = connectToServer(to_print: false);
                printf("<hr><h2> Form Results </h2>");

                // Print the received string
                $fname = $_POST["fname"];
                printf("<h3> Search Term: $fname </h3>");

                // Compose and print the query
                $conn->query("USE Mocko_Ex;"); //Select which db to use
                $query = "SELECT Person.id AS Person_ID, 
                    Person.FirstName AS FirstName, 
                    Course.CourseName AS Course 
                FROM Person, Course, Person_Takes_Course 
                WHERE Person.id = Person_Takes_Course.P_ID 
                    AND Course.c_id=Person_Takes_Course.C_ID 
                    AND Person.FirstName LIKE '%%$fname%%';";
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
                    printf("<label for=\"course_id\">Courses:</label><br>");
                    printf("<select name=\"course_id\">");
                    foreach ($table as $row) {
                        printf("<option value=%d>%s</option>\n", $row[0], $row[2]);
                    }
                    printf("<\select>");
                }

                $conn->close();
            ?>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>