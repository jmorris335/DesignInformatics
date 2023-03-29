<?php 
    /**
     * This file hosts a collections of commonly used functions. It should not be called directly, but can be invoked by writing "include 'functions.php'"
     */

    /**
     * Connects to the MySQL server using the username "root" with the same password. The programmer must close the connection after use.
     * 
     * @param string $servername = "localhost" Name of the server
     * @param string $username = "root" Username of database user
     * @param string $password = "root" Password of database user
     * @param string $to_print = true Prints to the screen if successfully connected.
     * @param int $port = 8889 Port number
     *  
     * @return mysqli::construct The connection to the database 
     */
    function connectToServer(string $servername = "localhost", string $username = "root", string $password = "root", bool $to_print = true, int $port = 888) {       
        // Create connection
        $conn = new mysqli($servername, $username, $password, null, $port);
        
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
        if ($to_print) {
            echo "Connected successfully";
        }
        
        return $conn;
    }

    /**
     * Prints a table that has been accessed using a set formatting style. Must be included inside an html block.
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

    /**
     * Performs an mysql operation to reload all the database information from the specified file (which must contain the output of an mysqldump). Assumes that the dump was performed with the "--databases" option, so that the file contains CREATE statements and ERASE statements as necessary.
     * 
     * @param string $mysql_path the path to the binary executable of mysql (mine is
     *                          /Applications/MAMP/Library/bin/mysql)
     * @param string $filename the name of the file with the mysqldump information
     */
    function reloadFromDump(string $mysql_path, string $filename = 'db_dump.sql') {
        $command;
        if (OSisWindows()) {
            $command = ".\\$mysql_path.exe --host=localhost --user=root --password=root < $filename";
        }
        else {
            $command = "$mysql_path --host='localhost' --user='root' --password='root' < $filename";    
        }

        printf("<p>Command executed: \n".$command."</p>");
        $output = null;
        $retval = null;
        exec($command, $output, $retval);
        echo "Returned with status $retval and output:\n";
        foreach ($output as $value) {
            printf($value);
            printf("<br>");
        }
    }

    /**
     * Performs a mysqldump off the inputted databases to the specified file.
     * 
     * @param array $databases the names of the databases to be dumped
     * @param string $mysqldump_path the path to the binary executable of mysqldump; 
     *                               mine is /Applications/MAMP/Library/bin/mysqldump
     * @param string $filename the name of the file to be created (or overwritten)
     *                         during the dump.
     */
    function getDumpFile(array $databases, string $mysqldump_path, string $filename = 'db_dump.sql') {
        $db_string = implode(" ", $databases);
        $command;
        if (OSisWindows()) {
            $command = ".\\$mysqldump_path.exe --host=localhost --user=root --password=root --databases $db_string > $filename";
        }
        else {
            $command = "$mysqldump_path --host='localhost' --user='root' --password='root' --databases $db_string > $filename"; 
        }  

        printf("<p>Command executed: \n".$command."</p>");
        $output = null;
        $retval = null;
        exec($command, $output, $retval);
        echo "Returned with status $retval and output:\n";
        printf("<br>");
        foreach ($output as $value) {
            printf("\t$value");
            printf("<br>");
        }
    }

    /**
     * Returns true if the current OS is a Windows platform, otherwise returns false
     */
    function OSisWindows() {
        if (strtoupper(substr(PHP_OS, 0, 3)) === 'WIN') {
            return true;
        } else {
            return false;
        }
    }
?>