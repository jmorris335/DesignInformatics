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
            <form method='post' action=''>
                <div class='row'>
                    <div class='col-25'>
                        <label for='entity'>Select the Entity to Edit</label>
                        </div>
                        <div class='col-75'>
                            <select id='entity' name='entity'>
                                <option value="" disabled selected>Select...</option>
                                <option value="Printer">Printer</option> 
                                <option value="Printer Part">Printer Part</option>
                                <option value="Printer Material">Printer Material</option> 
                                <option value="Part Sensor">Part Sensor</option>
                                <option value="Print Job">Print Job</option>
                                <option value="Maintenance Log">Maintenance Log</option>
                                <option value="Vendor">Vendor</option>
                            </select>   
                        </div>
                        </div>
                        <div class ='submit-row'>
                        <input type="submit" value="Submit">
                        <input type="reset" value="Reset">
                </div>
                </form>
                <?php
                // This statement receives infromation from the dropdown, and restates it to confirm to the user while creating the variable $Entity
                    if (isset($_POST["entity"])) {
                        $Entity = $_POST["entity"];
                        printf("Entity Selected is: $Entity<br> Would you like to edit, add, or delete a printer?");
                    } ?>

                    <!-- The prupose of this section is to confirm the selection based on the first submission, this enables the info to direct the page opened after the entity is chosen-->
                    <!-- Copy Start here for connecting to new page...-->
                    <?php if ($_POST["entity"]=="Printer"): ?>
                        <form method='post' action='Printer_Actions/Edit_Printer.php'>
                            <div class ='submit-row'>
                            <input type="submit" value="Edit">
                    </form>
                        <form method='post' action='Printer_Actions/Add_Printer.php'>
                            <div class ='submit-row'>
                            <input type="submit" value="Add">
                    </form>
                        <form method='post' action='Printer_Actions/Delete_Printer2.php'>
                            <div class ='submit-row'>
                            <input type="submit" value="Delete">
                    </form>
                    <?php endif; ?>
                    <!-- Copy End here...-->

        </div>
        <!-- connect form to if statement to open new formn for editing the database -->
        <p> Design Informatics, (c) 2023 </p>
    </body>
</html>
