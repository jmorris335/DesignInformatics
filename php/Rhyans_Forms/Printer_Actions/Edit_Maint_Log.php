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

        <h1> Edit Maintenance Log </h1>

        <?php
            include_once ("../../functions.php");
            include_once ("../../SQL_functions.php");
            $conn = connectToServer(to_print: false);
            $conn->query("USE 3DPrinterDT;");
        ?>

        <div class='form-container'>
            <form method='post' action='' target="_self">
                <div class='row'>
                    <div class='col-25'>
                        <label for='log_name'>Choose Log to Edit</label>
                    </div>
                    <div class='col-75'>
                        <select name="log_name" onchange ="GetText();" >
                            <option disabled selected>Select...</option>
                            <?php
                                $log_name = getTable("maintenance_log", $conn);
                                foreach ($log_name as $ln) {
                                    printf("<option value=".$ln["mlog_ID"].">".$ln["timestamp"]." </option>");
                                }
                            ?>
                            </select>
                    </div>
                </div>

                <div class='row'>
                    <div class='col-25'>
                        <label for='Notes_value'>Edit Notes</label>
                    </div>
                    <div class='col-75'>
                        <textarea id="Notes_value" name="Notes_value" rows="10" cols="50"></textarea>
                    </div>
                </div>

                <div class ='submit-row'>
                        <input type="submit" value="Submit">
                        <input type="reset" value="Reset">
                </div>
            </form>
        </div>

        <script>
            <?php $log_name = getTable("maintenance_log", $conn);?>
            const log_name = <?php echo json_encode($log_name); ?>;
        </script>

        <?php
            // Receive the submitted form and edit chosen printer parameter

            include_once ("../../../generator/classes/printer.php");

             if (isset ($_POST["log_name"]) && !empty($_POST["Notes_value"])){
                $query = "UPDATE `maintenance_log` SET `notes` = \"".$_POST['Notes_value']."\" WHERE `maintenance_log`.`mlog_ID` = '".$_POST["log_name"]."';";
                $Results = $conn-> query($query);
                printf("<br> Query: $query");
            }
                else{
             };

            $conn->close();
        ?>
        <!-- <script>
            function GetText();
            var notes = "<?php //echo $conn->query("SELECT `notes` FROM `maintenance_log` WHERE `maintenance_log`.`mlog_ID` = '".$_POST["log_name"]."';");?>"
        </script> -->

        <p> Design Informatics, (c) 2023 </p>
    </body>
</html>
