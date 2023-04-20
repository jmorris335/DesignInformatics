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

            if (isset($_POST['table_name'])) {$table_name = $_POST['table_name'];}
            else {$table_name = "Print_Job";}
            
            $attributes = getColumnLabels($table_name, $conn);
            $table = getTable($table_name, $conn);
        ?>

        <div style="overflow:scroll">
            <table>
                <?php
                    printf("<h3> $table_name </h3>");

                    printf("<table>");
                    for ($i = 0; $i < count($attributes); $i++) {
                        printf("<th>%s</th>\n", $attributes[$i]);
                    }
                    foreach($table as $row) {
                        $entity_id = $row[0];
                        printf("
                            <tr>
                                <td>
                                    <form method=\"post\" action=\"view_entity.php\">
                                    <input type=\"hidden\" name=\"entity_ID\" id=\"entity_ID\" value=\"$entity_id\">
                                    <input type=submit class='link' value=\"$entity_id\">
                                </td>");
                                for ($i=1; $i<count($attributes); $i++) {
                                    printf("<td>%s</td>\n", $row[$attributes[$i]]);
                                }
                        printf("
                                </form>
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
