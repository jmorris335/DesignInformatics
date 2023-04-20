<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Print Job Parameters</title>
        <link rel="stylesheet" href="../web/css/styles.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="../web/js/app.js"></script>
    </head>
    <body onLoad="changeUnitGroups()">
        <?php include "../web/nav.php"; printTopNav(); ?>

        <h1> Add Print Job Parameters </h1>

        <?php
            include_once ("functions.php");
            include_once ("SQL_functions.php");
            $conn = connectToServer(to_print: false);
            $conn->query("USE 3DPrinterDT;");

            $results = $conn->query("SELECT DISTINCT `Unit`.`unit_group` FROM `Unit`;");
            $unit_groups = $results->fetch_all(MYSQLI_BOTH);

            // Receive the submitted form and make a new parameter job
            include_once ("../generator/classes/print_job.php");
            include_once ("../generator/classes/job_parameter.php");

            if (isset($_POST["designer"]) && $_POST["material"] && $_POST["printer"]) {
                // On first page access create a new print job (if redirected from submit_job.php)
                $job = new PrintJob($_POST["designer"], $_POST["printer"], $_POST["material"],
                                    $_POST["stl_file"], $_POST["gcode_file"]);
                insertEntity(array($job), "Print_Job", $conn);
                $results = $conn->query("SELECT MAX(job_ID) FROM Print_Job;");
                $job_id = $results->fetch_all(MYSQLI_BOTH)[0][0];
                $_POST["job_id"] = $job_id;
            }
        ?>

        <div class='form-container'>
            <form method='post' action='' target="_self">
                
                <div class='row'>
                    <div class='col-25'>
                        <label for='p_name'>Parameter Name</label>
                    </div>
                    <div class='col-75'>
                        <select name="p_name" onchange="changeUnitGroups(this.value);">
                            <option disabled selected>Select...</option>
                            <option value="custom_option">Enter new parameter...</option>
                            <?php
                                $job_params = getTable("Job_Parameter", $conn);
                                foreach ($job_params as $jp) {
                                    printf("<option value=".$jp["jobparam_ID"].">".$jp["jobparam_name"]." (".$jp["unit"].")</option>");
                                }
                            ?>
                            <input type="text" name="p_name" style="display:none;" disabled="disabled" onblur="if($(this).val()=='')showOptions('p_name')">
                        </select>
                    </div>
                </div>

            
                <div class='row'>
                    <div class='col-25'>
                        <label for='p_value'>Value</label>
                    </div>
                    <div class='col-75'>
                        <input type="text" id='p_value' name='p_value'>
                    </div>
                </div>

                <div class='row'>
                    <div class='col-25'>
                        <label for='p_group'>Type</label>
                    </div>
                    <div class='col-75'>
                        <select id='p_group' name='p_group' onChange="changeUnitNames(this.value);">
                            <!-- Options here come from name selection, filtered by js function "changeUnitNames" below-->
                            </select>
                    </div>
                </div>

                <div class='row'>
                    <div class='col-25'>
                        <label for='p_units'>Units</label>
                    </div>
                    <div class='col-75'>
                        <select id='p_units' name='p_units'>
                            <option value="" disabled selected>Select...</option>
                            <!-- Options here come from group selection, filtered by js function "changeUnitGroup" below-->
                        </select>
                    </div>
                </div>
                <input type="hidden" name="job_id" id="job_id" value="<?php printf($_POST['job_id']); ?>">

                <div class ='submit-row'>
                        <input type="submit" value="Add Parameter">
                        <input type="submit" value="Submit to Queue" formaction="printer_overview.php">
                        <input type="reset" value="Reset">
                </div>
            </form>
        </div>

        <script>
            <?php $job_params = getTable("Job_Parameter", $conn);?>
            <?php $units = getTable("Unit", $conn);?>
            const job_params = <?php echo json_encode($job_params); ?>;
            const units = <?php echo json_encode($units); ?>;
            const unit_groups = <?php echo json_encode($unit_groups); ?>;
            const type_options = document.getElementById("p_group");
            const unit_options = document.getElementById("p_units");

            /**
             * Finds the appropriate unit group to display for the selected param type. Also checks if the user is inputting a custom field
             */
            function changeUnitGroups(param_ID) {
                var out = "<option disabled selected>Select...</option>";
                var unit_group = "";
                if (param_ID == 'custom_option') {
                    showCustomInput('p_name')
                }
                console.log(param_ID);
                for (i = 0; i < unit_groups.length; i++) {
                    out += "<option value=" + unit_groups[i]['unit_group'];
                    for (j = 0; j < job_params.length; j++) {
                        if (job_params[j]['jobparam_ID'] == param_ID) {
                            const job_unit_name = job_params[j]['unit'];
                            for (k = 0; k < units.length; k++) {
                                if (units[k]['unit_name'] == job_unit_name) {
                                    if (unit_groups[i]['unit_group'] == units[k]['unit_group']) {
                                        out += " selected";
                                        unit_group = unit_groups[i]['unit_group'];
                                    }
                                }
                            }
                        }
                    }
                    out += ">" + unit_groups[i]['unit_group'] + "</option>";
                }
                type_options.innerHTML = out;
                changeUnitNames(unit_group);
            }

            /**
             * Finds the appropriate unit names for the inputted group and selects the default option
             */
            function changeUnitNames(unit_group) {
                if (unit_group.length == 0) unit_options.innerHTML = '<option value="" disabled selected>(Choose unit type)</option>';
                else {
                    var printerOptions = "";
                    for (i = 0; i < units.length; i++) {
                        if (units[i]["unit_group"] === unit_group) {
                            printerOptions += "<option value=" + units[i]["unit_name"];
                            if (units[i]["is_main"]) {
                                printerOptions += " selected";
                            }
                            printerOptions += ">" + units[i]["unit_name"] + "</option>";
                        }
                    }
                    unit_options.innerHTML = printerOptions;
                }
            }
        </script>

        <?php
            if (!empty($_POST["p_name"]) && !empty($_POST["p_units"])) {
                // Check if the new job parameter should be added to the db (and add it if so)
                $jp_name = getJobParamName($_POST["p_name"], $conn);
                $unique = jobParamIsUnique($jp_name, $_POST["p_units"], $conn);
                if ($unique) {
                    $job_param = new JobParameter($jp_name, $_POST["p_units"]);
                    insertEntity(array($job_param), "Job_Parameter", $conn);
                }   
            }

            function jobParamIsUnique(string $jp_name, string $jp_unit, mysqli $conn) {
                // Checks if the job parameter is unique in the table
                $query = "SELECT * FROM Job_Parameter 
                          WHERE jobparam_name = \"$jp_name\"
                          AND Job_Parameter.unit = \"$jp_unit\";";
                $result = $conn->query($query);
                if($result->num_rows == 0) { return TRUE;}
                else {return FALSE;}
            }

            function getJobParamName(string $jp_id, mysqli $conn) {
                // Gets the name of the job param for the given id
                if (!is_numeric($jp_id)) {return $jp_id;}
                $query = "SELECT jobparam_name FROM Job_Parameter WHERE jobparam_id = \"$jp_id\";";
                $results = $conn->query($query);
                $jp_name = $results->fetch_all(MYSQLI_BOTH)[0][0];
                return $jp_name;
            }

            if (!empty($_POST["p_value"]) && isset($_POST["p_name"])) {
                // Add param to the print job
                $cols = array("job_ID", "jobparam_ID", "value");
                mysqli_refresh($conn, MYSQLI_REFRESH_TABLES);

                $results = $conn->query("SELECT MAX(job_ID) FROM Print_Job;");
                $job_id = $results->fetch_all(MYSQLI_BOTH)[0][0];

                if (!is_numeric($_POST["p_name"])) {
                    $query = "SELECT jobparam_ID FROM Job_Parameter 
                              WHERE jobparam_name = \"".$_POST['p_name']."\";";
                    $results = $conn->query($query);
                    $jobparam_id = $results->fetch_all(MYSQLI_BOTH)[0][0];
                }
                else {
                    $jobparam_id = $_POST["p_name"];
                }

                $input = array(array($job_id, $jobparam_id, $_POST["p_value"]));
                $query = makeInsertQuery("Print_Job_Has_Job_Parameter", $cols, $input);
                $conn->query($query);

                printf("<br> <h3> Parameter ".getJobParamName($_POST["p_name"], $conn)." added with value ".$_POST["p_value"]."</h3>");
            }

            $conn->close();
        ?>

        <p> Design Informatics, (c) 2023 </p>
    </body>
</html>
