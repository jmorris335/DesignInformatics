<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage DB Entities</title>
        <link rel="stylesheet" href="../../web/css/styles.css">
    </head>
    <body>
        <?php include "../../web/nav.php"; printTopNav(); ?>

        <h1> Select an Entity to Manage </h1>

        <?php
            include_once ("../functions.php");
            include_once ("../SQL_functions.php");
            $conn = connectToServer(to_print: false);
            $conn->query("USE 3DPrinterDT;");
        ?>

        <!-- Below is a hard-coded dropdown list of descriptors which will (hopefully, eventually) lead to specific entities one can edit-->
        
        <div class='form-container'>
            <form method='post' action='' target='_self'>
                <div class='row'>
                    <div class='col-25'>
                        <label for='entity'>Select the Entity to Manage</label>
                        </div>
                        <div class='col-75'>
                            <select id='entity' name='entity'>
                                <option value="" disabled selected>Select...</option>
                                <option value="Printer">Printer</option> 
                                <option value="Part">Printer Part</option>
                                <option value="Part_Parameters">Part Parameters</option>
                                <option value="Material">Printer Material</option>
                                <option value="Material_Loaded_In_Printer">Loaded Materials</option> 
                                <option value="Sensor">Part Sensor</option>
                                <option value="Print_Job">Print Job</option>
                                <option value="Maintenance_Log">Maintenance Log</option>
                                <option value="Part_Has_Maintenance_Log">Attach Maintenance Log to Part</option>
                                <option value="Vendor">Vendor</option>
                                <option value="Unit">Unit</option>
                            </select>   
                        </div>
                        </div>
                        <div class ='submit-row'>
                        <input type="submit" value="Edit/View Entity" formaction="../view_entities.php">
                        <input type="submit" value="Add Entity" formaction="../add.php">
                        <input type="reset" value="Reset">
                </div>
            </form>
        </div>

        <p> Design Informatics, (c) 2023 </p>
    </body>
</html>
