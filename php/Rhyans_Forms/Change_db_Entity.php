<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>3D Printers Overview</title>
        <link rel="stylesheet" href="../../web/css/styles.css">
    </head>
    <body>
        <?php include "../../web/nav.php"; printTopNav(); ?>

        <h1> Submit a change to an intity within the database </h1>

        <?php
            include_once ("../functions.php");
            include_once ("../SQL_functions.php");
            $conn = connectToServer(to_print: false);
            $conn->query("USE 3DPrinterDT;");
        ?>

<!-- Below is a hard-coded dropdown list of descriptors which will (hopefully, eventually) lead to specific entities one can edit-->
        
        <div class='form-container'>
            <form method='post'>
                <div class='row'>
                    <div class='col-25'>
                        <label for='entity'>Select the Entity to Edit</label>
                    </div>
                    <div class='col-75'>
                        <select id='entity' name='entity'>
                            <option value="" disabled selected>Select...</option>
                            <option value="Printer">Printer</option> 
                            <option value="Print Job">Print Job</option>
                            <option value="Maintenance Log">Maintenance Log</option>  
                        </select>   
                             
                        </select>
                    </div>
                </div>
                
                </div>
                <div class ='submit-row'>
                        <input type="submit" value="Submit">
                        <input type="reset" value="Reset">
                </div>
            </form>
        </div>

        <?php
            // Receive the submitted form
            if (isset($_POST["designer"])) {
                $designer = $_POST["designer"];
                printf("Designer is: $designer");
            }
            if (isset($_POST["material"])) {
                $mat = $_POST["material"];
                printf("Material is: $mat");
            }
            if (isset($_POST["printer"])) {
                $printer = $_POST["printer"];
                printf("Printer is: $mat");
            }


            // TODO: Handle submitted form

            $conn->close();
        ?>

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
                                printerOptions += "<option value=" + all_printer_mats[j]["printer_ID"]+ ">" + all_printer_mats[j]["printer_name"] + " (" + all_printer_mats[j]["model"] + ")" + "</option>";
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
