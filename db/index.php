<html>
    <head>
        <link rel="stylesheet" href="../web/css/styles.css">
    </head>
    <body>
        <div class="topnav">
            <a href="http://localhost:8888/DesignInformatics/">Main Overview</a>
            <a href="http://localhost:8888/DesignInformatics/index.html">Main Page</a>
            <a href="http://localhost:8888/DesignInformatics/php/main.php">Printer Overview</a>
            <a class="active" href="http://localhost:8888/DesignInformatics/db/">Sync DBs</a>
            <a href="http://localhost:8888/phpMyAdmin5/index.php">phpMyAdmin</a>
            <a href="http://localhost:8888/DesignInformatics/php/demos">Class Demos</a>
        </div>
        <h1> Load Databases </h1>
        <p> Click "Backup Databases" after making a change to any given database, then sync your changes using Git. You can also select "Reload Database" to load the latest changes (if they've been previously backed up and synced to GitHub). </p>
        <form method="post">
            <input type="submit" name="backup"
                    class="button" value="Backup Databases" />
                
            <input type="submit" name="reload"
                    class="button" value="Reload Databases" />
        </form>
        <?php
            include '../php/functions.php';
            include '../system_info.php';
            $databases = array("Mocko_Ex", "3DPrinterDT");

            printf("<p> Hello </p>");

            if(array_key_exists('backup', $_POST)) {
                getDumpFile($databases, $mysqldump_path);
                postResults("Backup", $databases);
            }
            else if(array_key_exists('reload', $_POST)) {
                reloadFromDump($mysql_path);
                postResults("Reload", $databases);
            }

            function postResults(string $action, $databases) {
                printf("<h3> ".$action." completed </h3>");
                printf("<h4> Databases affected:</h4>");
                printf("<ul>");
                foreach ($databases as $db) {
                    printf("<li>".$db."</li>");
                }
                printf("</ul>");
            }
        ?>
        <p> If the right databases aren't getting backed up, edit this file to include them in the calling variable</p>
        <p> Note that if you aren't getting the functions to return with status 0 you may have a problem with your executable path. Make sure to set the path to mysql and mysqldump in the file 'system_info.php'</p>
    </body>
</html>