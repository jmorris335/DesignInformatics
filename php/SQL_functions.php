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
            elseif ($row[$i] instanceof DateTimeImmutable || $row[$i] instanceof DateTime ) {
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
        $set_str = $set_str.$set_columns[$i]." = \"".$set_values[$i]."\"";
        if ($i != count($set_columns) - 1) {
            $set_str = $set_str." AND ";
        }
    }
    $where_str = "";
    for ($i = 0; $i < min(array(count($where_columns), count($where_values))); $i++) {
        $where_str = $where_str.$where_columns[$i]." = \"".$where_values[$i]."\"";
        if ($i != count($where_columns) - 1) {
            $where_str = $where_str." AND ";
        }
    }
    return "UPDATE $table_name SET $set_str WHERE $where_str;";
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

/**
 * Returns the data type for each column in the table
 * 
 * @param string $table_name The name of the table in the database
 * @param mysqli $conn Connection to the server
 * @param string $database_name = "3DPrinterDT", the name of the database where the table is stored
 * @return array A 2D array, where the key for each field is the column name, and the value is the datatype as a string
 */
function getDataTypes(string $table_name, mysqli $conn, string $database_name= "3DPrinterDT") {
    $query = "SELECT column_name,data_type 
              FROM information_schema.columns 
              WHERE table_schema = '$database_name' 
              AND table_name = '$table_name';";
    $results = $conn->query($query);
    return $results->fetch_all(MYSQLI_BOTH);
}

/**
 * Returns an array representing the inputted table
 * 
 * @param string $table_name The name of the table in the database to select
 * @param mysqli $conn Connection to the server
 * @param string $database_name = "3DPrinterDT", the name of the database where the table is stored
 * @return array An 2D array, where each item represents a row in the table, and each field is called by the column names
 * 
 * @example
 *  $table = getTable("Printer", $conn);
 *  $first_pk = $table[0]["printer_ID"];
 *  printTables($table, array("printer_ID", "location"));
 */
function getTable(string $table_name, mysqli $conn, string $database_name= "3DPrinterDT") {
    $query = "SELECT * FROM $database_name.$table_name;";
    $results = $conn->query($query);
    return $results->fetch_all(MYSQLI_BOTH);
}

/**
 * Returns a filtered array representing the desired values
 * 
 * @param string $table_name The name of the table in the database to select
 * @param string $value_name The name of the value to retrieve from the table
 * @param string $filter_name The name of the value to filter by
 * @param string $filter_value Value of the filter
 * @param mysqli $conn Connection to the server
 * @param string $database_name = "3DPrinterDT", the name of the database where the table is stored
 * @return array An 2D array, where each item represents a row in the table, and each field is called by the column names
 */ 
function getValues(string $table_name, string $value_name, string $filter_name, string $filter_value,
                  mysqli $conn, string $database_name= "3DPrinterDT") {
    $query = "SELECT $value_name FROM $database_name.$table_name
              WHERE $table_name.$filter_name = \"$filter_value\";";
    $results = $conn->query($query);
    return $results->fetch_all(MYSQLI_BOTH);
}

/**
 * Returns a list of all foreign keys composing the specified table
 * 
 * @param string $table_name The name of the table in the database to search within
 * @param mysqli $conn Connection to the server
 * @param string $database_name = "3DPrinterDT", the name of the database where the table is stored
 * @return array An 2D array, where each row is a foreign key with column labels:
 *      - COLUMN_NAME: Name of the column in the selected table referencing the foreign key
 *      - REFERENCED_TABLE_NAME: Name of the table holding the foreign key
 *      - REFERENCED_COLUMN_NAME: Name of the column in the foreign key table
 */
function getForeignKeysInTable(string $table_name, mysqli $conn, string $database="3DPrinterDT") {
    $query = "SELECT COLUMN_NAME, REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME
              FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
              WHERE REFERENCED_TABLE_SCHEMA = '3DPrinterDT' 
              AND TABLE_NAME = '$table_name';";
    $results = $conn->query($query);
    return $results->fetch_all(MYSQLI_BOTH);
}

function getPrinterStatus(int $printer_id, mysqli $conn) {
    $query = "SELECT is_connected, is_busy, is_available, needs_service, has_error
        FROM 3DPrinterDT.Printer_State
        WHERE timestamp = (
            SELECT max(timestamp)
            FROM 3DPrinterDT.Printer_State
            WHERE printer_ID = $printer_id);";
    $results = $conn->query($query);
    $rows = $results->fetch_all(MYSQLI_BOTH);
    $row = $rows[0];
    if (!$row["is_connected"]) {
        return "NOT CONNECTED";
    }
    else if ($row["is_available"]) {
        return "AVAILABLE";
    }
    else if ($row["is_busy"]) {
        return "BUSY";
    }
    else if ($row["needs_service"]) {
        return "NEEDS SERVICE";
    }
    else {
        return "ERROR";
    }
}

/**
 * Sets the printer status
 * 
 * @param int $printer_id PK of printer to update status for
 * @param string $new_status String with one of the following values:
 *      - "NOT CONNECTED": Printer is not reachable
 *      - "AVAILABLE": Printer is available for printing
 *      - "BUSY": Printer is working properly but not available for printing
 *      - "NEEDS SERVICE": Printer is not working properly and needs maintenance
 *      - "ERROR": Default state, where there is some error preventing proper status
 * @param mysqli $conn Connection to the db
 */
function setPrinterStatus(int $printer_id, string $new_status, mysqli $conn) {
    $has_error = false;
        $new_status = strtolower($new_status);
        if ($new_status === "not connected") {
            $is_connected = false;
            $is_available = false;
        }
        else {
            $is_connected = true;
            if($new_status === "available") {
                $is_available = true;
                $is_busy = false;
                $needs_service = false;
            }
            else {
                $is_available = false;
                if($new_status === "busy") {
                    $is_busy = true;
                    $needs_service = false;
                }
                else {
                    $is_busy = false;
                    if($new_status === "needs service") {
                        $needs_service = true;
                    }
                    else {
                        $has_error = true;
                    }
                }
            }
        }
    $date = new DateTime("now");
    $date_string = $date->format("Ymd");
    $insert_cols = array("printer_ID", "timestamp", "is_available", "is_connected", "is_busy", "needs_service", "has_error");
    $insert_vals = array($printer_id, $date_string, $is_available, $is_connected, $is_busy, $needs_service, $has_error);
    $query = makeInsertQuery("Printer_State", $insert_cols, $insert_vals);
    $conn->query($query);
}

/**
 * Gets the volumes of all the materials in the printer based on the most recent sensor data
 * 
 * @param int $printer_id The id of the printer to return results for
 * @param mysqli $conn connection to the mysql server
 */
function getMaterialsInPrinter(int $printer_id, mysqli $conn) {
    $conn->query("USE 3DPrinterDT;");
    $query = "SELECT Material.mat_ID, volume, mat_name
    FROM Material_Loaded_In_Printer
    INNER JOIN Material
    ON Material_Loaded_In_Printer.mat_ID = Material.mat_ID
    WHERE Material_Loaded_In_Printer.timestamp = 
        (SELECT MAX(Material_Loaded_In_Printer.timestamp) 
        FROM 3DPrinterDT.Material_Loaded_In_Printer)
    AND printer_ID = $printer_id;";
    $result = $conn->query($query);
    return $result->fetch_all(MYSQLI_BOTH);
}

/**
 * Composes the array for each entity to use the makeInsert method, then grabs the ID made by the MySQL server and assigns it to the entity.
 * 
 * @param array $ent_array array of entities that have three methods: 
 *      toArray(): outputs each value of the entity that will be entered into the DB (not foreign keys)
 *      getNonKeyColumns(): outputs the name of each of the columns matching to the values returned by the toArray() method
 *      setID(string $pk): Sets the primary key of the entity with $pk
 * @param string $table_name name of the table in the DB to enter the data into
 * @param mysqli $conn connection to the mysql server
 */
function insertEntity(array $ent_array, string $table_name, mysqli $conn) {
    $insert_ent = array();
    foreach ($ent_array as $ent) {
        if (method_exists($ent, "toArray")) {
            array_push($insert_ent, $ent->toArray());
        }
    }
    $query = makeInsertQuery($table_name, $ent_array[0]->getNonKeyColumns(), $insert_ent);
    // Debugging: 
    // printf("<br>");
    // printf("$table_name: $query");
    $conn->query($query);
    setPK($ent_array, $table_name, $conn);
}

/**
 * Queries the database for the primary key of each entity and sets it using the setID method. Must be called directly after inserting the entity array.
 * 
 * @param array $ent_array An array of entities that have three methods:
 *      toArray(): outputs each value of the entity that will be entered into the DB (not foreign keys)
 *      getNonKeyColumns(): outputs the name of each of the columns matching to the values returned by the toArray() method
 *      setID(string $pk): Sets the primary key of the entity with $pk
 * @param string $table_name name of the table in the DB to enter the data into
 * @param mysqli $conn connection to the mysql server
 */
function setPK(array $ent_array, string $table_name, mysqli $conn) {
    $result = $conn->query("SELECT last_insert_id();"); // Get recently inserted pk
    $curr_pk = $result->fetch_all(MYSQLI_NUM)[0][0]; // Grab value
    foreach ($ent_array as $ent) {
        $ent->setID($curr_pk);
        $curr_pk++;
    }
}

/**
 * Returns every job currently listed as in the queue of the printer
 * @param string $printer_id The pk of the printer
 * @param mysqli $conn connection to the mysql server
 * @return array 2D array with each job and all parameters
 */
function getPrinterQueue(string $printer_ID, mysqli $conn) {
    $query = "SELECT *
              FROM Print_Job
              WHERE Print_Job.printer_ID = $printer_ID
              AND Print_Job.in_queue = 1
              ORDER BY Print_Job.submission_time DESC;";
    $results = $conn->query($query);
    $jobs = $results->fetch_all(MYSQLI_BOTH);
    return $jobs;
}

/**
 * Returns all print jobs currently printing on the selected printer
 * @param string $printer_id The pk of the printer
 * @param mysqli $conn connection to the mysql server
 * @return array 2D array with each job and all parameters
 */
function getCurrentPrintJob(string $printer_ID, mysqli $conn) {
    $query = "SELECT * FROM Print_Job
            WHERE Print_Job.printer_ID = $printer_ID
            AND Print_Job.in_queue = 0
            AND (Print_Job.print_start_time IS NOT NULL
            OR Print_Job.print_start_time <> '')
            AND Print_Job.print_start_time < now()
            AND (Print_Job.print_finish_time IS NULL 
            OR Print_Job.print_finish_time = ''
            OR Print_Job.print_finish_time > now());";
    $results = $conn->query($query);
    $jobs = $results->fetch_all(MYSQLI_BOTH);
    return $jobs;
}

/**
 * Returns a timestamp from the DB as a properly formatted string
 * @param string $timestamp The timestamp as read from the mysql DB
 * @return string The formatted time
 */
function formatTimestamp(string $timestamp) {
    $time = strtotime($timestamp);
    return date("M d, y g:i A", $time);
}
?>