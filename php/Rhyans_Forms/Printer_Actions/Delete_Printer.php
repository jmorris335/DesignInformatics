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

        <h1> Edit Printer Attribute </h1>

        <!--Connect to database-->
        <?php
            include_once ("../../functions.php");
            include_once ("../../SQL_functions.php");
            $conn = connectToServer(to_print: false);
            $conn->query("USE 3DPrinterDT;");
        ?>

        <!--Make gray containment box-->
        <div class='form-container'>
            <form method='post' action='' target="_self">
                
                <!--List of Printers in the database-->
                <div class='row'>
                    <div class='col-25'>
                        <label for='p_group'>Printer</label>
                    </div>
                    <div class='col-75'>
                        <select id='Select_ID' name='Printer'>
                            <option value="" disabled selected>Select...</option>
                            <?php
                                $ptr = getTable("printer", $conn);
                                printDropDownForm($ptr, array("printer_name"));
                            ?>
                        </select>
                    </div>
                </div>
                <!--Submit and Reset Buttons-->
                <div class ='submit-row'>
                        <input type="submit" value="Delete">
                        <input type="reset" value="Reset">
                </div>
                </form>
                <p> Design Informatics, (c) 2023 </p>

</div>
    </body>
</html>
