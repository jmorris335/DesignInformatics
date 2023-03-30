<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>3D Printers Overview</title>
        <link rel="stylesheet" href="../web/css/styles.css">
    </head>
    <body>
        <?php include "../web/nav.php"; printTopNav(); ?>

        <h1> Submit a Print Job </h1>

        <?php
            include_once ("functions.php");
            include_once ("SQL_functions.php");
            $conn = connectToServer(to_print: false);
            $conn->query("USE 3DPrinterDT;");

            // Get printer variables for conditional drop down values (passed to JS function)
            $query = "SELECT Printer.printer_ID, model, mat_ID
                FROM Printer, Printer_State, Material_Loaded_In_Printer
                WHERE Printer_State.printer_ID = Printer.printer_ID
                AND Printer_State.printer_ID = Material_Loaded_In_Printer.printer_ID
                AND Printer_State.is_available = 1;";
            $result = $conn->query($query);
            $all_printer_mats = $result->fetch_all(MYSQLI_BOTH);
            $query = "SELECT Printer.printer_ID, model 
                FROM Printer, Printer_State
                WHERE Printer_State.printer_ID = Printer.printer_ID
                AND Printer_State.is_available = 1;";
            $result = $conn->query($query);
            $all_printers = $result->fetch_all(MYSQLI_BOTH);
        ?>

        <div class='form-container'>
            <form method='post' action=''>
                <div class='row'>
                    <div class='col-25'>
                        <label for='designer'>Select the Designer</label>
                    </div>
                    <div class='col-75'>
                        <select id='designer' name='designer'>
                            <option value="" disabled selected>Select...</option>
                            <?php
                                $employees = getTable("Employee", $conn);
                                printDropDownForm($employees, array("first_name", "last_name"));
                            ?>
                        </select>
                    </div>
                </div>
                <div class='row'>
                    <div class='col-25'>
                        <label for='material'>Select the Material to Use</label>
                    </div>
                    <div class='col-75'>
                        <select id='material' name='material' onChange="changePrinter(this.value);">
                            <option value="" disabled selected>Select...</option>
                            <?php
                                $printer_id = 1;
                                $mats = getTable("Material", $conn);
                                printDropDownForm($mats, array("mat_name", "color"));
                            ?>
                        </select>
                    </div>
                </div>
                <div class='row'>
                    <div class='col-25'>
                        <label for='printer'>Select Printer</label>
                    </div>
                    <div class='col-75'>
                        <select id='printer' name='printer'>
                            <option value="" disabled selected>Select...</option>
                            <!-- Options here come from material selection, filtered by js function "changePrinter" below-->
                        </select>
                    </div>
                </div>
                <div class='row'>
                    <div class='col-25'>
                        <label for='stl_file'>Upload STL File</label>
                    </div>
                    <div class='col-75'>
                        <input type='file' id='stl_file' name='stl_file'>
                    </div>
                </div>
                <div class='row'>
                    <div class='col-25'>
                        <label for='gcode_file'>Upload Gcode File</label>
                    </div>
                    <div class='col-75'>
                        <input type='file' id='gcode_file' name='gcode_file'>
                    </div>
                </div>
            </form>
        </div>

        <script>
            const printer_input = document.getElementById("printer");
            const all_printer_mats = <?php echo json_encode($all_printer_mats); ?>;
            const avl_printers = <?php echo json_encode($all_printers); ?>;

            function changePrinter(mat_id) {
                if (mat_id.length == 0) printer_input.innerHTML = "<option></option>";
                else {
                    var printerOptions = "";
                    for (i = 0; i < avl_printers.length; i++) {
                        for (j = 0; j < all_printer_mats.length; j++) {
                            if (all_printer_mats[j]["mat_ID"] === mat_id && all_printer_mats[j]["model"] === avl_printers[i]["model"]) {
                                printerOptions += "<option value=" + all_printer_mats[j]["printer_ID"]+ ">" + all_printer_mats[j]["model"] + "</option>";
                                break; 
                            }
                            else if (j === all_printer_mats.length - 1) {
                                printerOptions += "<option value=\"" + avl_printers[i]["printer_ID"]+ "\" disabled>" + avl_printers[i]["model"] + "</option>";
                            }
                        }
                    }
                    printer_input.innerHTML = printerOptions;
                }
            }
        </script>

        <p> Design Informatics, (c) 2023 </p>
    </body>
</html>
