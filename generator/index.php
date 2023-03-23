<html>
    <head>
        <link rel="stylesheet" href="../web/styles.css">
    </head>
    <body>
        <div class="topnav">
            <a class="active" href="http://localhost:8888/DesignInformatics/php/main.php">Main Overview</a>
            <a href="http://localhost:8888/DesignInformatics/db/">Sync DBs</a>
            <a href="http://localhost:8888/phpMyAdmin5/index.php">phpMyAdmin</a>
            <a href="http://localhost:8888/DesignInformatics/php/demos">Class Demos</a>
        </div>
        <h1> Generator Links </h1>
        <h3> Design Informatics, (c) 2023 </h3>

        <p> Note, links require the localhost port to be set to 8888. See the README.md file for more information</p>

        <h2> Generator Links </h2>

        <form action="initial_data_dump.php" method="post">
            <input type="submit" name="commit"
                    class="button" value="Commit Initial Data (Adds to DB)" />
        </form>
        <br>
    </body>

</html>
