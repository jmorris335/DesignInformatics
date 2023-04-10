<?php
function printTopNav(string $pagetitle = null) {
    printf('
        <div class="topnav">');
    if ($pagetitle === "Main Page") {
        printf('<a class="active" href="http://localhost:8888/DesignInformatics/index.php">Main Page</a>');
    }
    else {
        printf('<a href="http://localhost:8888/DesignInformatics/index.php">Main Page</a>');
    }
    printf('
        <div class="dropdown">
            <button class=dropbtn> Printer Overview
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-content">
                <a href="http://localhost:8888/DesignInformatics/php/main.php">Printer Interface</a>
                <a href="http://localhost:8888/DesignInformatics/php/submit_job.php">Submit Job</a>
            </div>
        </div>
    ');
    if ($pagetitle === "Sync DBs") {
        printf('<a class="active" href="http://localhost:8888/DesignInformatics/db/">Sync DBs</a>');
    }
    else {
        printf('<a href="http://localhost:8888/DesignInformatics/db/">Sync DBs</a>');
    }
    printf('
        <a href="http://localhost:8888/phpMyAdmin5/">phpMyAdmin</a>
        <a href="http://localhost:8888/DesignInformatics/php/demos">Class Demos</a>
        </div>
    ');
}
?>