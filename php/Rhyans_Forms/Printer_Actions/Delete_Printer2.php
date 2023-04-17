<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>3D Printers Overview</title>
        <link rel="stylesheet" href="../../../web/css/styles.css">
    </head>
    <body>
        <?php include "../../../web/nav.php"; printTopNav(); ?>

        <h1> Submit a Printer </h1>

        <?php
            include_once ("../../functions.php");
            include_once ("../../SQL_functions.php");
            $conn = connectToServer(to_print: false);
            $conn->query("USE 3DPrinterDT;");
        ?>

        <!-- Below is a hard-coded dropdown list of descriptors which will (hopefully, eventually) lead to specific entities one can edit-->
        
        <div class='form-container'>
            <form method='post' action='' target=_self>
                <div class='row'>
                    <div class='col-25'>
                        <label for='Select_ID'>Select the Printer to Delete</label>
                    </div>
                        <div class='col-75'>
                            <select id='Select_ID' name='Select_ID'>
                                <option value="" disabled selected>Select...</option>
                            <?php
                                $ptr = getTable("printer", $conn);
                                printDropDownForm($ptr, array("printer_name"));
                            ?>
                            </select>
                        </div>
                </div>
                    <div class ='submit-row'>
                        <input type="submit" value="Submit">
                        <input type="reset" value="Reset">
                    </div>
            </form>
                <?php
                 if (isset($_POST["Select_ID"])) {
                    $Select = $_POST["Select_ID"];
                    printf("<br>Entity selected is: $Select");
                 }
                 $sql = "DELETE FROM printer_state WHERE printer_ID=$Select;";
                 $conn->query($sql);
                 $sql = "DELETE FROM material_loaded_in_printer WHERE printer_ID=$Select;";
                 $conn->query($sql);
                 $sql = "DELETE FROM printer_can_print_material WHERE printer_ID=$Select;";
                 $conn->query($sql);
                 $sql = "DELETE FROM print_job WHERE printer_ID=$Select;";
                 $conn->query($sql);
                 $sql = "DELETE FROM printer WHERE printer_ID = $Select;";
                 $conn->query($sql);
                ?>

        </div>
        <!-- connect form to if statement to open new formn for editing the database -->
        <p> Design Informatics, (c) 2023 </p>
    </body>
</html>
