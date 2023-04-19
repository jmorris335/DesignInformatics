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

        <h1> Edit Printer Entity </h1>

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
                        <label for='p_name'>Printer Name</label>
                    </div>
                    <div class='col-75'>
                        <select name="p_name">
                            <option disabled selected>Select...</option>
                            <?php
                                $printer_name = getTable("printer", $conn);
                                foreach ($printer_name as $pn) {
                                    printf("<option value=".$pn["printer_ID"].">".$pn["printer_name"]." </option>");
                                }
                            ?>
                        </select>
                    </div>
                </div>

                <div class='row'>
                    <div class='col-25'>
                        <label for='Att_Edit'>Attribute to Edit</label>
                    </div>
                    <div class='col-75'>
                        <select id='Att_Edit' name='Att_Edit'>
                            <option value="location">Location</option>
                            <option value="IPv6">IP address</option>
                            <option value="model">Model</option>
                            <option value="printer_name">Printer Name</option>
                            </select>
                    </div>
                </div>

                <div class='row'>
                    <div class='col-25'>
                        <label for='Att_value'>New Value</label>
                    </div>
                    <div class='col-75'>
                        <input type="text" id='Att_value' name='Att_value'>
                    </div>
                </div> 

                <div class ='submit-row'>
                        <input type="submit" value="Submit">
                        <input type="reset" value="Reset">
                </div>
            </form>
        </div>

        <script>
            <?php $printer_name = getTable("printer", $conn);?>
            const printer_name = <?php echo json_encode($printer_name); ?>;
            const att_options = document.getElementById("Att_Edit");
        </script>

        <?php
            // Receive the submitted form and edit chosen printer parameter

            include_once ("../../../generator/classes/printer.php");

             if (isset ($_POST["p_name"]) && isset($_POST["Att_Edit"]) && !empty($_POST["Att_value"])){
                $query = "UPDATE `printer` SET `".$_POST['Att_Edit']."` = \"".$_POST['Att_value']."\" WHERE `printer`.`printer_ID` = 1;";
                $results = $conn-> query($query);
                printf("<br> Query: $query"); }
                else{
                printf("<b style=\"color:red;\"> You must fill all fields </b>");
             };

            $conn->close();
        ?>

        <p> Design Informatics, (c) 2023 </p>
    </body>
</html>
