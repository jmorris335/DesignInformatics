<?php
function printTopNav(string $pagetitle = null) {
    printf('
        <div class="topnav">
            <a href="http://localhost:8888/DesignInformatics/php/printer_overview.php">Printer Interface</a>
            <div class="dropdown">
                <button class=dropbtn> Print Jobs
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="http://localhost:8888/DesignInformatics/php/submit_job.php">Submit Job</a>
                    <a href="http://localhost:8888/DesignInformatics/php/print_report.php">Add Job Report</a>
                </div>
            </div>
            <a href="http://localhost:8888/DesignInformatics/php/sensor_data.php">Data Overview</a>
            <a href="http://localhost:8888/DesignInformatics/php/Rhyans_Forms/Change_db_Entity.php">Manage Database</a>
            <div class="dropdown">
                <button class=dropbtn> Tools
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="http://localhost:8888/DesignInformatics/db/">Sync DBs</a>
                    <a href="http://localhost:8888/DesignInformatics/generator/initial_data_dump.php/">Reload DBs</a>
                    <a href="http://localhost:8888/phpMyAdmin5/">phpMyAdmin</a>
                    <a href="http://localhost:8888/DesignInformatics/php/demos">Class Demos</a>
                </div>
            </div>
        </div>
    ');
}
?>