<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Entities</title>
        <link rel="stylesheet" href="../web/css/styles.css">
    </head>
    <body>
        <?php 
                include "../web/nav.php"; printTopNav(); 

                include_once ("functions.php");
                include_once ("SQL_functions.php");
                $conn = connectToServer(to_print: false);
                $conn->query("USE 3DPrinterDT;");

                
        ?>
        
        <h3> Filter Options </h3>
        <div class='form-container'>
            <form method='post' action='' target='_self'>
                <div class='row'>
                    <div class='col-25'>
                        <label for='printer'>Filter by Printer</label>
                    </div>
                    <div class='col-75'>
                        <select id='printer' name='printer' onChange="changePart(this.value);">
                            <option value="" disabled selected>Select...</option>
                            <?php
                                $printers = getTable("Printer", $conn);
                                printDropDownForm($printers, array("printer_name"));
                            ?>
                        </select>
                    </div>
                </div>
                <div class='row'>
                    <div class='col-25'>
                        <label for='part'>Filter by Part</label>
                    </div>
                    <div class='col-75'>
                        <select id='part' name='part' onChange="changeSensor(this.value);">
                            <option value="" disabled selected>Select...</option>
                            <?php
                                $parts = getTable("Part", $conn);
                                printDropDownForm($parts, array("part_name"));
                            ?>
                        </select>
                    </div>
                </div>
                <div class='row'>
                    <div class='col-25'>
                        <label for='printer'>Filter by Sensor</label>
                    </div>
                    <div class='col-75'>
                        <select id='sensor' name='sensor'>
                            <option value="" disabled selected>Select...</option>
                            <?php
                                $sensors = getTable("Sensor", $conn);
                                printDropDownForm($sensors, array("sensor_name"));
                            ?>
                        </select>
                    </div>
                </div>
                <div class ='submit-row'>
                        <input type="submit" value="Submit">
                        <input type="reset" value="Reset">
                        
                </div>
            </form>
        </div>


        <?php
            $table_name = "Sensor_Data";

            $query = "SELECT Sensor_Data.data_ID, Sensor_Data.timestamp, Sensor_Data.data_name,
            Sensor_Data.value, Sensor_Data.sensor_ID, Sensor_Data.unit, Sensor.part_ID, Part.printer_ID
            FROM Sensor_Data, Sensor, Part
            WHERE Sensor_Data.sensor_ID = Sensor.sensor_ID
            AND Sensor.part_ID = Part.part_ID";

            if (!empty($_POST['sensor'])) {
                $sensor_id = $_POST['sensor'];
                $query = $query." AND Sensor.sensor_ID = $sensor_id";
            }
            elseif (!empty($_POST['part'])) {
                $part_id = $_POST['part'];
                $query = $query." AND Sensor.part_ID = $part_id";
            }
            elseif (!empty($_POST['printer'])) {
                $printer_id = $_POST['printer'];
                $query = $query." AND Part.printer_ID = $printer_id";
            }
            $query = $query." ORDER BY Sensor_Data.timestamp ASC, Sensor_Data.data_ID ASC;";
            
            $attributes = array("data_ID", "timestamp", "data_name", "value", "sensor_ID", "unit",
                                "part_ID", "printer_ID");
            $results = $conn->query($query);
            $table = $results->fetch_all(MYSQLI_BOTH);
        ?>

        <div style="overflow:scroll">
            <table>
                <?php
                    printf("<h3> Sensor Data Overview </h3>");

                    printf("<table>");
                    for ($i=0; $i < count($attributes); $i++) {
                        printf("<th>%s</th>\n", $attributes[$i]);
                    }
                    foreach($table as $row) {
                        $entity_id = $row[0];
                        printf("
                            <tr>");
                                for ($i=0; $i<count($attributes); $i++) {
                                    printf("<td>%s</td>\n", $row[$attributes[$i]]);
                                }
                        printf("
                            </tr>");
                    }
                    printf("</table>\n");
                ?>
            </table>
        </div>

        <?php
            $conn->close();
        ?>

        <p> Design Informatics, (c) 2023 </p>
    </body>
</html>
