<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View/Edit Entity </title>
        <link rel="stylesheet" href="../web/css/styles.css">
    </head>
    <body>
        <?php include "../web/nav.php"; printTopNav(); ?>

        <?php
            include_once ("functions.php");
            include_once ("SQL_functions.php");
            $conn = connectToServer(to_print: false);
            $conn->query("USE 3DPrinterDT;");
            mysqli_refresh($conn, MYSQLI_REFRESH_TABLES);

            if (isset($_POST['entity'])) {$table_name = $_POST['entity'];}
            else {$table_name = "Printer";}
            if (isset($_POST['entity_ID'])) {$entity_id = $_POST['entity_ID'];}
            else {$entity_id = "1";}

            printf("<h1> Entity $entity_id in $table_name </h1>");
            
            $attributes = getColumnLabels($table_name, $conn);
            $table = getTable($table_name, $conn);
            $index = array_search($entity_id, array_column($table, 0));
            $values = $table[$index];
            $data_types = getDataTypes($table_name, $conn);
            $fks = getForeignKeysInTable($table_name, $conn);
            $fk_attributes = array();
            foreach ($attributes as $attribute) {
                $fk_values[$attribute] = getForeignKeyValues($fks, $attribute, $conn);
                if (in_array($attribute, array_column($fks, 'COLUMN_NAME'))) {
                    array_push($fk_attributes, $attribute);
                }
            }
            

            /**
             * Gets the values for the foreign key specified
             */
            function getForeignKeyValues(array $fks, string $attribute_name, mysqli $conn) {
                $index = array_search($attribute_name, array_column($fks, 'COLUMN_NAME'));
                if ($index === False) {return array();}
                $fk_table_name = $fks[$index]['REFERENCED_TABLE_NAME'];
                $fk_attribute_name = $fks[$index]['REFERENCED_COLUMN_NAME'];
                $table = getTable($fk_table_name, $conn);
                $vals = array();
                foreach ($table as $row) {
                    array_push($vals, $row[$fk_attribute_name]);
                }
                return $vals;
            }

            /**
             * Prints the default label for each attribute with an edit button
             */
            function printAttributeLabel(string $attribute_name, mixed $value) {
                if (gettype($value) != "string") {$value = "N/A";}
                printf("
                    <div class='row' id='$attribute_name' name='$attribute_name'>
                        <div class='col-25' style='display:flex; flex-direction: row;'>
                            <button class='button_link' onClick=\"editRow('$attribute_name')\"> Edit </button>
                            <label for='$attribute_name' style='padding-left: 15px'>$attribute_name</label>
                        </div>
                        <div class='col-75' style='padding-top: 10px;'>
                            <div>$value</div>
                        </div>
                    </div>
                ");
            }
        ?>

        <div class='form-container'>
            <form method='post' action='' target='_self'>
                <?php
                    printf("
                    <input type=\"hidden\" name=\"entity\" id=\"entity\" value=\"$table_name\">
                    <input type=\"hidden\" name=\"entity_ID\" id=\"entity_ID\" value=\"$entity_id\">");
                    for ($i = 1; $i < count($attributes); $i++) {
                        printAttributeLabel($attributes[$i], $values[$i]);
                    }
                ?>
                <div class ='submit-row'>
                        <input type="submit" value="Submit Changes">
                        <input type="reset" value="Reset">
                </div>
            </form>
        </div>

        <?php
            // Receive the submitted form
            $is_form_filled = False;
            $new_attributes = array();
            $new_values = array();
            foreach ($attributes as $attribute) {
                if (isset($_POST[$attribute])) {
                    array_push($new_attributes, $attribute);
                    array_push($new_values, $_POST[$attribute]);
                    $is_form_filled = True;
                }
            }

            if ($is_form_filled) {
                $query = makeUpdateQuery($table_name, $new_attributes, $new_values, array($attributes[0]), array($entity_id));
                $conn->query($query);
                printf("<br><h3> Entity $table_name updated</h3>");
            }

            $conn->close();
        ?>

        <script>
            const fks = <?php echo json_encode($fks); ?>;
            const fk_values = <?php echo json_encode($fk_values); ?>;
            const fk_attributes = <?php echo json_encode($fk_attributes); ?>;
            const data_types = <?php echo json_encode($data_types); ?>;

            function editRow(rowID) {
                if (fk_attributes.includes(rowID)) {
                    values = fk_values[rowID]
                    document.getElementById(rowID).innerHTML = printAttributeDropdown(rowID, values);
                }
                else {
                    let data_type = "text";
                    for (const row in data_types) {
                        if (data_types[row]['column_name'] == rowID) {
                            data_type = data_types[row]['data_type'];
                            break;
                        }
                    }
                    document.getElementById(rowID).innerHTML = printAttributeInput(rowID, data_type);
                }
            }

            function printAttributeDropdown(attribute_name, values) {
                var out = "<div class='row'> \n\t<div class='col-25'>";
                out += "\n\t\t<label for='$attribute_name'>Select " + attribute_name + "</label>\n\t</div>";
                out += "\n\t<div class='col-75'>";
                out += "\n\t\t<select id='" + attribute_name + "' name='" + attribute_name + "'>";
                out += "\n\t\t\t<option value='' disabled selected>Select...</option>";
                for (const value of values) {
                    out += "\n\t\t\t<option value='" + value + "'> " + value + "</option>";
                }
                out += "<\n\t\t/select>\n\t</div>\n</div>";
                return out;
            }

            function printAttributeInput(attribute_name, data_type="text") { 
                let input_type = "type='text'";
                if (data_type == "int") {input_type = "type='number' step='1'";}
                else if (data_type == "decimal") {input_type = "type='number'";}
                else if (data_type == "datetime") {input_type = "type='datetime-local'";}
                else if (data_type == "tinyint") {input_type = "type='number' min='0' max='1', step='1'";}

                var out = "<div class='row'>";
                out += "\n\t<div class='col-25'>";
                out += "\n\t\t<label for='" + attribute_name + "'>Set " + attribute_name + " (" + data_type + ")</label>";
                out += "\n\t</div>";
                out += "\n\t<div class='col-75'>";
                out += "\n\t\t<input "+ input_type + "id='" + attribute_name + "' name='" + attribute_name + "'>";
                out += "\n\t</div>\n</div>";
                return out;
            }
        </script>

        <p> Design Informatics, (c) 2023 </p>
    </body>
</html>
