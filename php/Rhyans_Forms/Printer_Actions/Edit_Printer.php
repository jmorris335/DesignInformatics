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

            $results = $conn->query("SELECT DISTINCT `Unit`.`unit_group` FROM `Unit`;");
            $unit_groups = $results->fetch_all(MYSQLI_BOTH);
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
                        <select id='printer' name='Printer'>
                            <option value="" disabled selected>Select...</option>
                            <?php
                                $ptr = getTable("printer", $conn);
                                printDropDownForm($ptr, array("printer_name"));
                            ?>
                        </select>
                    </div>
                </div>

                <!--List of Printer Attributes that can be edited-->
                <div class='row'>
                        <div class='col-25'>
                            <label for='p_name'>Attribute Name</label>
                        </div>
                        <div class='col-75'>
                            <?php
                            $result = $conn->query("SELECT `COLUMN_NAME` FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA`='3dprinterdt' AND `TABLE_NAME`='printer'");
                                echo '<html>';
                                echo '<body>';
                                echo '<select id="Attr">';
                            while($row = $result->fetch_assoc()) {
                                echo '<option value="'.$row['COLUMN_NAME'].'">'.$row['COLUMN_NAME'].'</option>';
                            }
                                echo '</select>';
                                echo '</body>';
                                echo '</html>';
                            ?>
                            </div>
                </div>

                <!--New Value for the Attribute and Printer Chosen-->
                <div class='row'>
                    <div class='col-25'>
                        <label for='p_value'>New Value</label>
                    </div>
                    <div class='col-75'>
                        <input type="text" id='p_value' name='p_value'>
                    </div>
                </div>

                <!--Submit and Reset Buttons-->
                <div class ='submit-row'>
                        <input type="submit" value="Add Parameter">
                        <input type="reset" value="Reset">
                </div>
            </form>
        </div>


        <script>
            <?php $Printer_Name = getTable("printer", $conn);?>
            const Printer_Name = <?php echo json_encode($Printer_Name); ?>;

        </script>

        <?php
        $sql = "UPDATE `printer` SET $id = $p_value WHERE `printer`.$p_group = 1;";
        ?>

        <p> Design Informatics, (c) 2023 </p>
    </body>
</html>
