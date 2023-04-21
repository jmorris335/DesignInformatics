<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Entity </title>
        <link rel="stylesheet" href="../web/css/styles.css">
    </head>
    <body>
        <?php include "../web/nav.php"; printTopNav(); ?>

        <?php
            include_once ("functions.php");
            include_once ("SQL_functions.php");
            $conn = connectToServer(to_print: false);
            $conn->query("USE 3DPrinterDT;");

            if (isset($_POST['entity'])) {$table_name = $_POST['entity'];}
            else {$table_name = "Printer";}

            printf("<h1> Add New $table_name </h1>");
            
            $attributes = getColumnLabels($table_name, $conn);
            if (tableHasAutoIncrementingID($table_name, $conn)) {
                // Remove auto-incrementing PK if applicable
                $attributes = array_slice($attributes, 1);
            }
            $data_types = getDataTypes($table_name, $conn);
            $fks = getForeignKeysInTable($table_name, $conn);

            /**
             * Gets the values for the foreign key specified
             */
            function getForeignKeyValues(array $fks, string $attribute_name, mysqli $conn) {
                $index = array_search($attribute_name, array_column($fks, 'COLUMN_NAME'));
                $fk_table_name = $fks[$index]['REFERENCED_TABLE_NAME'];
                $fk_attribute_name = $fks[$index]['REFERENCED_COLUMN_NAME'];
                $table = getTable($fk_table_name, $conn);
                $vals = array();
                foreach ($table as $row) {
                    array_push($vals, $row[$fk_attribute_name]);
                }
                return $vals;
            }

            function printAttributeDropdown(string $attribute_name, array $values) {
                printf("
                    <div class='row'>
                        <div class='col-25'>
                            <label for='$attribute_name'>Select ".ucfirst($attribute_name)."</label>
                        </div>
                        <div class='col-75'>
                            <select id='$attribute_name' name='$attribute_name'>
                                <option value='' disabled selected>Select...</option>");
                                foreach ($values as $value) {
                                    printf("<option value=$value> $value </option>");
                                }
                printf("
                            </select>
                        </div>
                    </div>
                ");
            }

            /**
             * Prints a input in the form for the specified attribute
             */
            function printAttributeInput(string $attribute_name, string $data_type= "Float") {
                if ($data_type == "int") {
                    $input_type = "type='number' step='1'";
                }
                else if ($data_type == "decimal") {
                    $input_type = "type='number'";
                }
                else if ($data_type == "datetime") {
                    $input_type = "type='datetime-local'";
                }
                else if ($data_type == "tinyint") {
                    $input_type = "type='number' min='0' max='1', step='1'";
                }
                else if ($data_type == "blob") {
                    $input_type = "type='file'";
                }
                else {
                    $input_type = "type='text'";
                }
                printf("
                    <div class='row'>
                        <div class='col-25'>
                            <label for='$attribute_name'>Set ".ucfirst($attribute_name)." ($data_type)</label>
                        </div>
                        <div class='col-75'>
                            <input $input_type id='$attribute_name' name='$attribute_name'>
                        </div>
                    </div>
                ");
            }
        ?>

        <div class='form-container'>
            <form method='post' action='' target='_self'>
                <?php
                    printf("
                    <input type=\"hidden\" name=\"entity\" id=\"entity\" value=\"$table_name\">");
                    for ($i = 0; $i < count($attributes); $i++) {
                        if (in_array($attributes[$i], array_column($fks, 'COLUMN_NAME'))) {
                            $values = getForeignKeyValues($fks, $attributes[$i], $conn);
                            printAttributeDropdown($attributes[$i], $values);
                        }
                        else {
                            $data_type = $data_types[$i]['data_type'];
                            printAttributeInput($attributes[$i], $data_type);
                        }
                    }
                ?>
                <div class ='submit-row'>
                        <input type="submit" value="Add Entity">
                        <input type="reset" value="Reset">
                </div>
            </form>
        </div>

        <?php
            // Receive the submitted form
            $is_form_filled = True;
            $values = array();
            foreach ($attributes as $attribute) {
                if (isset($_POST[$attribute])) {
                    array_push($values, $_POST[$attribute]);
                }
                else {
                    $is_form_filled = False;
                    break;
                }
            }

            if ($is_form_filled) {
                $query = makeInsertQuery($table_name, $attributes, array($values));
                $conn->query($query);
                printf("<br><h3> Entity added to $table_name </h3>");
            }

            $conn->close();
        ?>


        <p> Design Informatics, (c) 2023 </p>
    </body>
</html>
