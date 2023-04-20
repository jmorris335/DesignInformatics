<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> View Entity Attributes </title>
        <link rel="stylesheet" href="../web/css/styles.css">
    </head>
    <body>
        <?php include "../web/nav.php"; printTopNav(); ?>

        <?php
            include_once ("functions.php");
            include_once ("SQL_functions.php");
            $conn = connectToServer(to_print: false);
            $conn->query("USE 3DPrinterDT;");

            if (isset($_POST['table_name'])) {$table_name = $_POST['table_name'];}
            else {$table_name = "Printer";}
            if (isset($_POST['entity_id'])) {$entity_id = $_POST['entity_id'];}
            else {$entity_id = "0";}
            
            $attributes = getColumnLabels($table_name, $conn);
            $table = getTable($table_name, $conn);
            $index = array_search($entity_id, array_column($table, 0));
            $values = $table[$index];

            /**
             * Prints a input in the form for the specified attribute
             */
            function printAttributeLabel(string $attribute_name, $value) {
                printf("
                    <div class='row'>
                        <div class='col-25'>
                            $attribute_name
                        </div>
                        <div class='col-75'>
                            $value
                        </div>
                    </div>
                ");
            }
        ?>

        <div class='form-container'>
            <?php
                for ($i = 0; $i < count($attributes); $i++) {
                    printAttributeLabel($attributes[$i], $values[$i]);
                }
            ?>
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
