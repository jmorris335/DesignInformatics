<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Changing Entities</title>
        <link rel="stylesheet" href="../../web/css/styles.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="../../web/js/app.js"></script>
    </head>
    <body onLoad="changeUnitGroups()">
        <?php include "../../web/nav.php"; printTopNav(); ?>

        <h1> Edit Entity </h1>

        <?php
            
            include_once ("../functions.php");
            include_once ("../SQL_functions.php");
            $conn = connectToServer(to_print: false);
            $conn->query("USE 3DPrinterDT;");

            $results = $conn->query("SELECT ALL `printer_name` FROM `printer`;");
            $printers = $results->fetch_all(MYSQLI_BOTH);
        ?>
        <script>
        var Entity = sessionStorage.getItem("Entity");
        console.log(Entity);
        <script>

        <div class='form-container'>
            <form method='post' action='' target="_self">
                <div class='row'>
                    <div class='col-25'>
                        <label for='p_group'>Type</label>
                    </div>
                    <div class='col-75'>
                        <select id='printer' name='Printer'>
                            <option value="" disabled selected>Select...</option>
                            <?php
                                $ptr = getTable("printer", $conn);
                                printDropDownForm($ptr, array("printer_name"));
                            ?>
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
                <div class ='submit-row'>
                        <input type="submit" value="Add Parameter">
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
            // Receive the submitted form and make a new parameter job
            include_once ("../generator/classes/print_job.php");
            include_once ("../generator/classes/job_parameter.php");

            if (isset($_POST["designer"]) && $_POST["material"] && $_POST["printer"]) {
                $job = new PrintJob($_POST["designer"], $_POST["printer"], $_POST["material"],
                                    $_POST["stl_file"], $_POST["gcode_file"]);
                insertEntity(array($job), "Print_Job", $conn);
            }

            if (isset($_POST["p_name"]) && isset($_POST["p_group"]) && isset($_POST["p_units"])) {
                $results = $conn->query("SELECT jobparam_name FROM Job_Parameter;");
                $jp_names = $results->fetch_all(MYSQLI_BOTH);
                $unique = TRUE;
                foreach ($jp_names as $jp_name) {
                    if ($jp_name[0] == $_POST["p_name"]) {
                        $unique = FALSE;
                        break;
                    }
                }
                if ($unique) {
                    $job_param = new JobParameter($_POST["p_name"], $_POST["p_units"]);
                    insertEntity(array($job_param), "Job_Parameter", $conn);
                }   
            }

            if (isset($_POST["p_value"]) && isset($_POST["p_name"])) {
                $cols = array("job_ID", "jobparam_ID", "value");

                $results = $conn->query("SELECT MAX(job_ID) FROM Print_Job;");
                $job_id = $results->fetch_all(MYSQLI_BOTH)[0][0];

                $results = $conn->query("SELECT jobparam_ID FROM Job_Parameter 
                                         WHERE jobparam_name = ".$_POST['p_name'].";");
                printf("SELECT jobparam_ID FROM Job_Parameter 
                WHERE jopparam_name = ".$_POST['p_name'].";");
                $jobparam_id = $results->fetch_all(MYSQLI_BOTH)[0][0];
                
                $input = array(array($job_id, $jobparam_id, $_POST["p_value"]));
                $query = makeInsertQuery("Print_Job_Has_Job_Parameter", $cols, $input);
                printf($query);
                $conn->query($query);
            }

            $conn->close();
        ?>

        <p> Design Informatics, (c) 2023 </p>
    </body>
</html>
