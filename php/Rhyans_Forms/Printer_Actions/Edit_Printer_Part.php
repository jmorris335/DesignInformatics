<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Print Job Parameters</title>
        <link rel="stylesheet" href="../../../web/css/styles.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="../../../web/js/app.js"></script>
    </head>
    <body onLoad="changeUnitGroups()">
        <?php include "../../../web/nav.php"; printTopNav(); ?>

        <h1> Edit Printer Part Parameters </h1>

        <?php
            include_once ("../../functions.php");
            include_once ("../../SQL_functions.php");
            $conn = connectToServer(to_print: false);
            $conn->query("USE 3DPrinterDT;");

            $results = $conn->query("SELECT DISTINCT `Unit`.`unit_group` FROM `Unit`;");
            $unit_groups = $results->fetch_all(MYSQLI_BOTH);
        ?>

        <div class='form-container'>
            <form method='post' action='' target="_self">

            <div class='row'>
                    <div class='col-25'>
                        <label for='part_name'>Part Name</label>
                    </div>
                    <div class='col-75'>
                        <select name="part_name">
                            <option disabled selected>Select...</option>
                            <?php
                                $part_name = getTable("part", $conn);
                                foreach ($part_name as $pn) {
                                    printf("<option value=".$pn["part_ID"].">".$pn["part_name"]." </option>");
                                }
                            ?>
                        </select>
                    </div>
                </div>
                
                <div class='row'>
                    <div class='col-25'>
                        <label for='p_name'>Parameter Name</label>
                    </div>
                    <div class='col-75'>
                        <select name="p_name" onchange="changeUnitGroups(this.value);">
                            <option disabled selected>Select...</option>
                            <?php
                                $job_params = getTable("Parameter", $conn);
                                foreach ($job_params as $jp) {
                                    printf("<option value=".$jp["param_ID"].">".$jp["param_name"]." (".$jp["unit"].")</option>");
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

                <div class ='submit-row'>
                        <input type="submit" value="Submit">
                        <input type="reset" value="Reset">
                </div>
            </form>
        </div>

        <script>
            <?php $job_params = getTable("Parameter", $conn);?>
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
                        if (job_params[j]['param_ID'] == param_ID) {
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
            include_once ("../../../generator/classes/print_job.php");
            include_once ("../../../generator/classes/Parameter.php");

            // Receive the submitted form and edit chosen printer parameter

             if (isset ($_POST["p_name"]) && !empty($_POST["p_value"])){
                $query = "UPDATE `part_parameters` SET `value` = \"".$_POST['p_value']."\" WHERE `part_parameters`.`part_ID` = '".$_POST["p_name"]."' AND `part_parameters`.`param_ID` = '".$_POST["part_name"]."';";
                $Results = $conn-> query($query);
                printf("<br> Query: $query");
            }
                else{
             };

            // $conn->close();

            //     // $input = array(array($job_id, $param_ID, $_POST["p_value"]));
            //     $query = "UPDATE `part_parameters` SET `value` = \"".$_POST['p_value']."\" WHERE `part_parameters`.`part_ID` = '".$_POST["p_name"]."' AND `part_parameters`.`param_ID` = '".$_POST["part_name"]."';";
            //     $conn->query($query);
            //     printf("$query");

            //     // printf("<br> <h3> Parameter ".getJobParamName($_POST["p_name"], $conn)." added with value ".$_POST["p_value"]."</h3>");
            // }

            $conn->close();
        ?>

        <p> Design Informatics, (c) 2023 </p>
    </body>
</html>
