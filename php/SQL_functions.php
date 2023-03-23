<?php
/**
 * Forms an general insert query for each value in the inputted array
 * 
 * @param string $table_name The name of the table the values are to be inserted into
 * @param array $col_set The name of each column where you want to insert into, as a string
 * @param array $values_set A 2D array, where each item is an array of connected entities. Each entity must be ordered according to the order of the database table.
 * @return string the formatted query
*/
function makeInsertQuery(string $table_name, array $col_set, array $values_set) {
    $col_str = "";
    foreach ($col_set as $col) {
        $col_str .= $col;
        if ($col != $col_set[count($col_set) - 1]) {
            $col_str .= ", ";
        }
    }

    $values_str = "";
    foreach($values_set as $row) {
        $values_str = $values_str."(";
        for ($i = 0; $i < count($row); $i++) {
            if (is_string($row[$i])) {
                $values_str .= "\"$row[$i]\"";
            }
            elseif ($row[$i] instanceof DateTimeImmutable) {
                $date_str = $row[$i]->format("Ymd");
                $values_str .= $date_str;
            }
            else {
                $values_str .= strval($row[$i]);
            }
            if ($i != count($row) - 1) {
                $values_str .= ",";
            }
        }
        $values_str .= ")";
        if ($row != $values_set[count($values_set) - 1]) {
            $values_str = $values_str.",";
        }
    }
    $query = "INSERT INTO 3DPrinterDT.$table_name ($col_str) VALUES $values_str;";
    return $query;
}

/**
 * Makes a general query to update a single row of a table.
 * 
 * @param string $table_name The name of the table in the database to be updated
 * @param array $set_columns The names of the columns of the table to be updated
 * @param array $set_values The values for each column being updated. Must be the same length as $set_columns
 * @param array $where_columns The names of the columns to be used for specifying which row to update
 * @param array $where_values The values for each column used for row specification. Must be the same length as $where_columns
 * @return string the formatted query
 */
function makeUpdateQuery(string $table_name, array $set_columns, array $set_values, array $where_columns, array $where_values) {
    $set_str = "";
    for ($i = 0; $i < min(array(count($set_columns), count($set_values))); $i++) {
        $set_str = $set_str.$set_columns[$i]." = ".$set_values[$i];
        if ($i != count($set_columns) - 1) {
            $set_str = $set_str." AND ";
        }
    }
    $where_str = "";
    for ($i = 0; $i < min(array(count($where_columns), count($where_values))); $i++) {
        $set_str = $set_str.$where_columns[$i]." = ".$where_values[$i];
        if ($i != count($where_columns) - 1) {
            $set_str = $set_str." AND ";
        }
    }
    return "UPDATE $table_name SET $set_str WHERE $where_str";
}

/**
   * Obtains the name of the primary key of the table. In the case of multiple primary keys, it only returns the initial key name.
   * 
   * @param string $table_name The name of the table in the database
   * @param mysqli $conn Connection to the server
   * @param string $database_name = "3DPrinterDT", the name of the database where the table is stored
   * @return string The name of the first primary key for the table
   */
  function getPK(string $table_name, mysqli $conn, string $database_name= "3DPrinterDT") {
    $query = "SHOW INDEX FROM $database_name.$table_name WHERE Key_name = 'PRIMARY';";
    $results = $conn->query($query);
    $rows = $results->fetch_all(MYSQLI_BOTH);
    $key_name = $rows[0]["Column_name"];
    return $key_name;
  }

   /**
   * Returns the name of each columns in the table.
   * 
   * @param string $table_name The name of the table in the database
   * @param mysqli $conn Connection to the server
   * @param string $database_name = "3DPrinterDT", the name of the database where the table is stored
   * @return array An ordered array of strings, where each item is a column label
   */
  function getColumnLabels(string $table_name, mysqli $conn, string $database_name= "3DPrinterDT") {
    $col_labels = array();
    $query = "SHOW COLUMNS FROM $database_name.$table_name;";
    $results = $conn->query($query);
    $rows = $results->fetch_all(MYSQLI_BOTH);
    foreach ($rows as $row) {
        array_push($col_labels, $row["Field"]);
    }
    return $col_labels;
  }
?>