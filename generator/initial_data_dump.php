<html>
    <body>
        <h1> Initial Data Dump</h1>
        <p> Note that each time you click the button the data will be readded to the database. Hopefully this page should only be displayed once! </p>
    </body>
</html>

<?php
/**
 *  This file creates the initial entities used in the database. This does not invoke any manually created entities, nor edits made to the entities originally. If called it will not overwrite any entities, unless specified to do so. It can be called from the generator index page.
 */
include_once ("../php/functions.php");
include_once("../php/SQL_functions.php");
include_once("classes/employee.php");
include_once ("classes/printer.php");
include_once ("classes/part.php");
include_once ("classes/vendor.php");
include_once ("classes/material.php");
include_once ("classes/role.php");

if(isset($_POST['commit'])) {
    makeInstances();
}

/**
 * Main caller function
 */
function makeInstances() {
    $vendors = makeVendors();
    $roles = makeRoles();
    $employees = makeEmployees($roles);
    $printers = makePrinters($vendors);
    $mats = makeMaterials($vendors[3]);
    insertEntities($printers, $vendors, $employees, $mats, $roles);
    insertNtoM($employees, $roles);
}

/**
 * Makes a set of default printers
 */
function makePrinters(array $vendors) {
    $printers = array();
    array_push($printers, new Printer("Main floor", "2001:db8::8a2e:370:7334", "F123 Composite Ready", $vendors[3]));
    array_push($printers, new Printer("Main floor", "2001:de8::8a2e:370:7334", "F770 Industrial 3D Printer", $vendors[3]));
    foreach ($printers as $printer) {
        makeParts($printer, $vendors);
    }
    return $printers;
}

/**
 * Makes a set of vendors
 */
function makeVendors() {
    $vendors = array();
    array_push($vendors, new Vendor("Precision Control Inc."));
    array_push($vendors, new Vendor("Datatronics"));
    array_push($vendors, new Vendor("Blue Ridge Printers"));
    array_push($vendors, new Vendor("Stratasys"));
    array_push($vendors, new Vendor("Ace Hardware"));
    return $vendors;
}

/**
 * Adds a set of default parts to the given printer
 */
function makeParts(Printer &$printer, array $vendors) {
    makeBed($printer, $vendors);
    makeNozzle($printer, $vendors);
    makeMotors($printer, $vendors);
    makeChamber($printer, $vendors);
}

/**
 * Makes a generic bed part and adds typical sensors
 */
function makeBed(Printer &$printer, array $vendors) {
    $bed = new Part("bed", $vendors[rand(0, count($vendors)-1)]);
    $bed->addSensor(new Sensor("bed_thermometer", "degF", 60, 65, 120));
    $bed->addSensor(new Sensor("bed_height_NW", "mm", 0, -5, 5));
    $bed->addSensor(new Sensor("bed_height_NE", "mm", 0, -5, 5));
    $bed->addSensor(new Sensor("bed_height_SW", "mm", 0, -5, 5));
    $bed->addSensor(new Sensor("bed_height_SE", "mm", 0, -5, 5));
    $bed->addSensor(new Sensor("bed_position_z", "mm", 800, 0, 800));
    $printer->addPart($bed);
}

/**
 * Makes a generic nozzle part and adds typical sensors
 */
function makeNozzle(Printer &$printer, array $vendors) {
    $nozzle = new Part("nozzle", $vendors[rand(0, count($vendors)-1)]);
    $nozzle->addSensor(new Sensor("nozzle_thermometer", "degF", 118, 65, 150));
    $nozzle->addSensor(new Sensor("nozzle_position_x", "mm", 0, 0, 610));
    $nozzle->addSensor(new Sensor("nozzle_position_y", "mm", 0, 0, 610));
}

/**
 * Makes 4 generic motor parts and adds typical sensors to each one
 */
function makeMotors(Printer &$printer, array $vendors) {
    $m_names = array("x_motor", "y_motor", "bed_motor", "feed_motor");
    foreach ($m_names as $m_name) {
        $motor = new Part($m_name, $vendors[0]);
        $motor->addSensor(new Sensor("motor_ammeter", "amps", 2.8, 0, 4));
        $motor->addSensor(new Sensor("motor_tachometer", "rpm", 0, 0, 250));
        $motor->addSensor(new Sensor("motor_thermometer", "degF", 60, 75, 120));
        $motor->addSensor(new Sensor("motor_accelerometer", "mm/s2", 0, 0, 2));
        $printer->addPart($motor);
    }
}

/**
 * Makes a generic chamber and adds typical sensors
 */
function makeChamber(Printer &$printer, array $vendors) {
    $chamber = new Part("chamber", $vendors[rand(0, count($vendors)-1)]);
    $chamber->addSensor(new Sensor("chamber_thermometer", "degF", 65, 65, 120));
    $chamber->addSensor(new Sensor("chamber_oxygen_level", "percent", 21, 0.5, 25));
    $chamber->addSensor(new Sensor("chamber_vaccuum_level", "Pa", 101300, 10, 101325));
    $printer->addPart($chamber);
}

/**
 * Makes a set of generic employees with roles
 */
 function makeEmployees($roles) {
    $employees = array();
    $first_names = array("Alice", "Bob", "Naya", "Ishaan", "Carl", "Johannes");
    $last_names = array("Smith", "Jones", "Khare", "Shahane", "Gonzalez", "Fischer");
    for ($i = 0; $i < 6; $i++) {
        $f_name = $first_names[rand(0, count($first_names)-1)];
        $l_name = $last_names[rand(0, count($last_names)-1)];
        $role = $roles[$i % count($roles)];
        $year = strval(rand(2012, 2022));
        $day = strval(rand(0, 365));
        $start_date = DateTimeImmutable::createFromFormat('Yz', $year.$day);
        array_push($employees, new Employee($f_name, $l_name, $role, $start_date));
    }
    return $employees;
 }

 /**
  * Makes a set of generic roles
  */
 function makeRoles() {
    $role_names = array("Designer", "Manager", "Technician", "Operator");
    $roles = array();
    foreach ($role_names as $r_name) {
        array_push($roles, new Role($r_name));
    }
    return $roles;
 }

 /**
  * Makes a set of generic materials from Stratasys
  */
 function makeMaterials(Vendor $vendor) {
    $mats = array();
    array_push($mats, new Material("Nylon 12 Carbon Fiber", 126, "Black", $vendor));
    array_push($mats, new Material("ULTEM™ 1010 resin", 130, "Amber", $vendor));
    array_push($mats, new Material("ABS-M30", 119, "White", $vendor));
    array_push($mats, new Material("ABS-M30", 126, "Blue", $vendor));
    array_push($mats, new Material("ABS-M30", 126, "Grey", $vendor));
    array_push($mats, new Material("Polycarbonate", 126, "Clear", $vendor));
    return $mats;
 }

 /**
  * Makes the basic entities and inserts them into the databases. Doesn't establish any relationships between them or secondary entities (sensor data, parameters, etc.)
  */
 function insertEntities($printers, $vendors, $employees, $mats, $roles) {
    $conn = connectToServer(to_print: false);
 
    insertEntityHelper($roles, "Role", $conn);
    insertEntityHelper($employees, "Employee", $conn);
    insertEntityHelper($vendors, "Vendor", $conn);
    insertEntityHelper($mats, "Material", $conn);
    insertEntityHelper($printers, "Printer", $conn);
    foreach($printers as $printer) {
        $printer->updatePartIDs();
        insertEntityHelper($printer->parts, "Part", $conn);
        foreach($printer->parts as $part) {
            $part->updateSensorIDs();
            insertEntityHelper($part->sensors, "Sensor", $conn);
        }
    }
    $conn->close();
 }

 /**
  * Composes the array for each entity to use the makeInsert method, then grabs the ID made by the MySQL server and assigns it to the entity.
  */
 function insertEntityHelper(array $ent_array, string $table_name, mysqli $conn) {
    $insert_ent = array();
    foreach ($ent_array as $ent) {
        if (method_exists($ent, "toArray")) {
            array_push($insert_ent, $ent->toArray());
        }
    }
    $conn->query(makeInsertQuery($table_name, $ent_array[0]->getNonKeyColumns(), $insert_ent));
    setIDs($ent_array, $table_name, $conn);
 }

  /**
  * Queries the database for the ID (primary key) of each entity and sets it using the setID method. Must be called directly after inserting the entity array.
  */
  function setIDs(array $ent_array, string $table_name, mysqli $conn) {
    $result = $conn->query("SELECT last_insert_id();"); // Get recently inserted pk
    $curr_pk = $result->fetch_all(MYSQLI_NUM)[0][0]; // Grab value
    foreach ($ent_array as $ent) {
        $ent->setID($curr_pk);
        $curr_pk++;
    }
  }

 /**
  * Inserts initial values for the N to M tables in the database. Must be called after insertEntities method.
  */
 function insertNtoM($employees, $roles) {
    $conn = connectToServer(to_print: false);

    $rows = array();
    foreach ($employees as $employee) {
        array_push($rows, array($employee->getID(), $employee->role->getID()));
    }
    $conn->query(makeInsertQuery("Employee_Has_Role", array(), $rows));
    $conn->close();
 }

 //TODO: Make secondary data: Printer status, mat_can_print, mat_in_printer
?>