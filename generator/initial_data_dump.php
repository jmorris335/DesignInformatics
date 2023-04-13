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
include_once ("classes/printer_state.php");

if(isset($_POST['commit'])) {
    makeInstances();
}

/**
 * Main caller function
 */
function makeInstances() {
    makeUnits();
    $vendors = makeVendors();
    $roles = makeRoles();
    $employees = makeEmployees($roles);
    $printers = makePrinters($vendors);
    $mats = makeMaterials($vendors[3]);
    insertEntities($printers, $vendors, $employees, $mats, $roles);
    updatePrinters($printers, $mats);
    insertSecondaryTables($employees, $roles, $printers);
}

/**
  * Makes the sets of units
  */
function makeUnits() {
    $units = array();
    $unit_cols = array("unit_name", "unit_group", "is_main");
    array_push($units, array("mm", "Length", 1));
    array_push($units, array("cm", "Length", 0));
    array_push($units, array("in", "Length", 0));
    array_push($units, array("m", "Length", 0));
    array_push($units, array("ft", "Length", 0));
    array_push($units, array("cm3", "Volume", 1));
    array_push($units, array("mm3", "Volume", 0));
    array_push($units, array("in3", "Volume", 0));
    array_push($units, array("mL", "Volume", 0));
    array_push($units, array("L", "Volume", 0));
    array_push($units, array("m3", "Volume", 0));
    array_push($units, array("g", "Mass", 1));
    array_push($units, array("oz", "Mass", 0));
    array_push($units, array("kg", "Mass", 0));
    array_push($units, array("s", "Time", 1));
    array_push($units, array("N", "Force", 1));
    array_push($units, array("lb", "Force", 0));
    array_push($units, array("degF", "Temperature", 1));
    array_push($units, array("degC", "Temperature", 0));
    array_push($units, array("deg", "Radial", 1));
    array_push($units, array("radians", "Radial", 0));
    array_push($units, array("amps", "Current", 1));
    array_push($units, array("volts", "Voltage", 1));
    array_push($units, array("rpm", "Rotation", 1));
    array_push($units, array("degpers", "Rotation", 0));
    array_push($units, array("radpers", "Rotation", 0));
    array_push($units, array("mm/s", "Velocity", 1));
    array_push($units, array("in/s", "Velocity", 0));
    array_push($units, array("mm/s2", "Acceleration", 1));
    array_push($units, array("Pa", "Pressure", 1));
    array_push($units, array("mmHg", "Pressure", 0));
    array_push($units, array("atm", "Pressure", 0));
    array_push($units, array("percent", "Proportion", 1));
    $query = makeInsertQuery("Unit", $unit_cols, $units);

    $conn = connectToServer(to_print: false);
    $conn->query($query);
    $conn->close();
}

/**
 * Makes a set of default printers
 */
function makePrinters(array $vendors) {
    $printers = array();
    array_push($printers, new Printer("Main floor", "2001:db8::8a2e:370:7334", "F123 Composite Ready", "Main Composite Printer", $vendors[3]));
    array_push($printers, new Printer("Main floor", "2001:de8::8a2e:370:7334", "F770 Industrial 3D Printer", "Big Grey Printer", $vendors[3]));
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
 * Makes a generic bed part and adds typical sensors and parameters
 */
function makeBed(Printer &$printer, array $vendors) {
    $bed = new Part("bed", $vendors[rand(0, count($vendors)-1)]);
    $bed->addParam(new Parameter("width", 615, "mm"));
    $bed->addParam(new Parameter("length", 615, "mm"));
    $bed->addParam(new Parameter("thickness", 10, "mm"));
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
    $nozzle->addParam(new Parameter("width", .2, "mm"));
    $nozzle->addSensor(new Sensor("nozzle_thermometer", "degF", 118, 65, 150));
    $nozzle->addSensor(new Sensor("nozzle_position_x", "mm", 0, 0, 610));
    $nozzle->addSensor(new Sensor("nozzle_position_y", "mm", 0, 0, 610));
    $printer->addPart($nozzle);
}

/**
 * Makes 4 generic motor parts and adds typical sensors to each one
 */
function makeMotors(Printer &$printer, array $vendors) {
    $m_names = array("x_motor", "y_motor", "bed_motor", "feed_motor");
    foreach ($m_names as $m_name) {
        $motor = new Part($m_name, $vendors[0]);
        $motor->addParam(new Parameter("shaft_diameter", 6.35, "mm"));
        $motor->addParam(new Parameter("step_angle", 1.8, "deg"));
        $motor->addParam(new Parameter("holding_torque", 470, "g"));
        $motor->addParam(new Parameter("weight", 6.35, "mm"));
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
    $chamber->addParam(new Parameter("volume", 302580, "cm3"));
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
    $first_names = array("Rhyan", "Will", "John", "Greg", "Kherissa");
    $last_names = array("Morgan", "Hawthorne", "Morris", "Mocko", "Taylor");
    for ($i = 0; $i < count($first_names); $i++) {
        $f_name = $first_names[$i];
        $l_name = $last_names[$i];
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
 
    insertEntity($roles, "Role", $conn);
    insertEntity($employees, "Employee", $conn);
    insertEntity($vendors, "Vendor", $conn);
    insertEntity($mats, "Material", $conn);
    insertEntity($printers, "Printer", $conn);
    foreach($printers as $printer) {
        $printer->updatePartIDs();
        insertEntity($printer->parts, "Part", $conn);
        foreach($printer->parts as $part) {
            $part->updateSensorIDs();
            insertEntity($part->sensors, "Sensor", $conn);
            insertEntity($part->params, "Parameter", $conn);
        }
    }
    $conn->close();
 }

/**
 * Adds a random number of materials that can be printed by each printer, loads these materials into the printer, and sets the status of each printer to "available"
 */
function updatePrinters(array $printers, array $materials) {
    foreach ($printers as $printer) {
        $printer->setStatus(new DateTimeImmutable());
        $indices = range(0, count($materials) - 1);
        shuffle($indices);
        $num_mats = rand(1, count($materials));
        for ($i = 0; $i < $num_mats; $i++) {
            $mat = $materials[$indices[$i]];
            $printer->addMatIDCanPrint($mat->getID());
            $printer->addMat($mat->getID(),  new DateTimeImmutable(), rand(0, 1) ? 1000 : 1500);
        }
    }
}

 /**
  * Inserts initial values for the secondary tables in the database. Must be called after insertEntities method. Processes the following tables:
  * - Employee_Has_Role
  * - Printer_Can_Print_Material
  * - Material_Loaded_In_Printer
  * - Printer_Status
  * - Part_Parameters
  */
function insertSecondaryTables($employees, $roles, $printers) {
    $conn = connectToServer(to_print: false);

    $rows = array();
    foreach ($employees as $employee) {
        array_push($rows, array($employee->getID(), $employee->role->getID()));
    }
    $conn->query(makeInsertQuery("Employee_Has_Role", array(), $rows));

    $rows = array();
    foreach ($printers as $printer) {
        foreach ($printer->mats_can_print as $mat_id) {
            array_push($rows, array($printer->getID(), $mat_id));
        }
    }
    $conn->query(makeInsertQuery("Printer_Can_Print_Material", array(), $rows));

    $rows = array();
    foreach ($printers as $printer) {
        foreach ($printer->mats_loaded as $mat) {
            array_push($rows, $mat->toArray());
        }
    }
    $conn->query(makeInsertQuery("Material_Loaded_In_Printer", array(), $rows));

    $rows = array();
    foreach ($printers as $printer) {
        foreach ($printer->statuses as $status) {
            array_push($rows, $status->toArray());
        }
    }
    $conn->query(makeInsertQuery("Printer_State", array(), $rows));

    foreach ($printers as $printer) {
        $rows = array();
        foreach ($printer->parts as $part) {
            foreach ($part->params as $param) {
                array_push($rows, array($param->getID(), $part->getID()));
            }
        }
        $conn->query(makeInsertQuery("Part_Parameters", array(), $rows));
    }

    $conn->close();
}
?>