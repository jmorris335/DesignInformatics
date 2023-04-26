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
                        <label for='sensor'>Filter by Sensor</label>
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
                        <input type="submit" value="Apply Filter(s)">
                        <input type="reset" value="Reset">
                        
                </div>
            </form>
        </div>


        <?php
            $table_name = "Sensor_Data";

            $query = "SELECT Sensor_Data.data_ID, Sensor_Data.timestamp, Sensor_Data.data_name,
            Sensor_Data.value, Sensor_Data.sensor_ID, Sensor_Data.unit, Part.part_name, Printer.printer_name
            FROM Sensor_Data, Sensor, Part, Printer
            WHERE Sensor_Data.sensor_ID = Sensor.sensor_ID
            AND Sensor.part_ID = Part.part_ID
            AND Part.printer_ID = Printer.printer_ID";

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
            
            $attributes = array("data_ID", "timestamp", "data_name", "value", "sensor_ID", 
                                "unit", "part_name", "printer_name");
            $labels = array("Data ID", "Timestamp", "Name", "Value", "Sensor ID", 
                                "Unit", "Part Name", "Printer Name");
            $results = $conn->query($query);
            $table = $results->fetch_all(MYSQLI_BOTH);
        ?>

        <div style="overflow:scroll">
            <table>
                <?php
                    printf("<h3> Sensor Data Overview </h3>");

                    printf("<table>");
                    for ($i=0; $i < count($attributes); $i++) {
                        printf("<th>%s</th>\n", $labels[$i]);
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

        <script>
            const part_input = document.getElementById("part");
            const sensor_input = document.getElementById("sensor");
            const parts = <?php echo json_encode($parts); ?>;
            const sensors = <?php echo json_encode($sensors); ?>;

            function changePart(printer_id) {
                var part_options = "<option value=\"\" disabled selected>Select...</option>";
                for (i = 0; i < parts.length; i++) {
                    if (parts[i]["printer_ID"] == printer_id) {
                        part_options += "\n<option value=" + parts[i]["part_ID"]+ ">" + parts[i]["part_name"] + "</option>";
                    }
                }
                part_input.innerHTML = part_options;
            }

            function changeSensor(part_id) {
                var sensor_options = "<option value=\"\" disabled selected>Select...</option>";
                for (i = 0; i < sensors.length; i++) {
                    if (sensors[i]["part_ID"] == part_id) {
                        sensor_options += "\n<option value=" + sensors[i]["sensor_ID"]+ ">" + sensors[i]["sensor_name"] + "</option>";
                    }
                }
                sensor_input.innerHTML = sensor_options;
            }

        </script>

        <?php
            $conn->close();
        ?>

        <p> Design Informatics, (c) 2023 </p>
    </body>
</html>
