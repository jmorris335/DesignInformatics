<?php 
    /**
     * This file hosts a collections of commonly used functions. It should not be
     * called directly, but can be invoked by writing "include 'functions.php'"
     */

    /**
     * Connects to the MySQL server using the username "root" with the 
     * same password. The programmer must close the connection after use.
     * 
     * @param string $servername = "localhost" Name of the server
     * @param string $username = "root" Username of database user
     * @param string $password = "root" Password of database user
     *  
     * @return mysqli::construct The connection to the database 
     */
    function connectToServer(string $servername = "localhost", string $username = "root", string $password = "root") {       
        // Create connection
        $conn = new mysqli($servername, $username, $password);
        
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
        echo "Connected successfully";
        
        return $conn;
    }

    /**
     * Prints a table that has been accessed using a set formatting style. 
     * Must be included inside an html block.
     * 
     * @param array $data a 2D array that defines the table to draw the
     *                    information from. See the example for how to generate.
     * @param array $columns a 1D array of string where each entry is an attribute 
     *                       of the table to display, in any order desired.
     * @example 
     *      <html>
     *      <?php
     *      include 'functions.php';
     *      $conn = connectToDB();
     *
     *      $query = 'SELECT * from ExampleDB.Books';
     *      $result = $conn->query($query);
     * 
     *      $books = $result->fetch_all(MYSQLI_BOTH);
     *
     *      printf("<h2> Table Results </h2>");
     *      $cols = array("Title", "Author", "Publish_Date", "Pages");
     *      printTable($books, $cols);
     *      printf("<br>");
     */
    function printTable(array $data, array $columns) {
        printf("<style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            text-align: center;
            padding: 5px;
        }
        </style>");

        printf("<table border = '2'>");
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
    }
?>