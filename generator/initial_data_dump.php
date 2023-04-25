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
    $params = makeParameters();
    makeJobParameters();
    $vendors = makeVendors();
    $roles = makeRoles();
    $employees = makeEmployees($roles);
    $printers = makePrinters($vendors, $params);
    $mats = makeMaterials($vendors[3]);
    insertEntities($printers, $vendors, $employees, $mats, $roles);
    updatePrinters($printers, $mats);
    insertSecondaryTables($employees, $roles, $printers, $mats);
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
    array_push($units, array("Nm", "Torque", 1));
    array_push($units, array("Nmm", "Torque", 0));
    array_push($units, array("lb_in", "Torque", 0));
    array_push($units, array("lb_ft", "Torque", 0));
    array_push($units, array("watt", "Power", 1));
    array_push($units, array("hp", "Power", 0));
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
    array_push($units, array("string", "Category", 1));
    $query = makeInsertQuery("Unit", $unit_cols, $units);

    $conn = connectToServer(to_print: false);
    $conn->query($query);
    $conn->close();
}

/**
 * Makes a set of default printers
 */
function makePrinters(array $vendors, $params) {
    $printers = array();
    array_push($printers, new Printer("Main floor", "2001:db8::8a2e:370:7334", "F123 Composite Ready", "Main Composite Printer", $vendors[3]));
    array_push($printers, new Printer("Main floor", "2001:de8::8a2e:370:7334", "F770 Industrial 3D Printer", "Big Grey Printer", $vendors[3]));
    foreach ($printers as $printer) {
        makeParts($printer, $vendors, $params);
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
function makeParts(Printer &$printer, array $vendors, $params) {
    makeBed($printer, $vendors, $params);
    makeNozzle($printer, $vendors, $params);
    makeMotors($printer, $vendors, $params);
    makeChamber($printer, $vendors, $params);
}

function makeParameters() {
    $params = array();
    array_push($params, new Parameter("width", "mm"));
    array_push($params, new Parameter("height", "mm"));
    array_push($params, new Parameter("depth", "mm"));
    array_push($params, new Parameter("thickness", "mm"));
    array_push($params, new Parameter("shaft_diameter", "mm"));
    array_push($params, new Parameter("step_angle", "deg"));
    array_push($params, new Parameter("holding_torque", "Nm"));
    array_push($params, new Parameter("mass", "g"));
    array_push($params, new Parameter("volume", "cm3"));
    array_push($params, new Parameter("material", "string"));

    $conn = connectToServer(to_print: false);
    insertEntity($params, "Parameter", $conn);
    $conn->close();
    return $params;
}

function makeJobParameters() {
    $jparams = array();
    array_push($jparams, array("init_bed_temp", "degF"));
    array_push($jparams, array("ss_bed_temp", "degF"));
    array_push($jparams, array("nozzle_speed", "mm/s"));
    array_push($jparams, array("layer_height", "mm"));
    array_push($jparams, array("layer_thickness", "mm"));
    array_push($jparams, array("infill", "percent"));

    $cols = array("jobparam_name", "unit");
    $conn = connectToServer(to_print: false);
    $query = makeInsertQuery("Job_Parameter", $cols, $jparams);
    $conn->query($query);
    $conn->close();
}

/**
 * Makes a generic bed part and adds typical sensors and parameters
 */
function makeBed(Printer &$printer, array $vendors, array $params) {
    $bed = new Part("bed", $vendors[rand(0, count($vendors)-1)]);
    $bed->addParam(array($params[0], 615));
    $bed->addParam(array($params[1], 615));
    $bed->addParam(array($params[3], 3));
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
function makeNozzle(Printer &$printer, array $vendors, $params) {
    $nozzle = new Part("nozzle", $vendors[rand(0, count($vendors)-1)]);
    $nozzle->addParam(array($params[1], 615));
    $nozzle->addSensor(new Sensor("nozzle_thermometer", "degF", 118, 65, 150));
    $nozzle->addSensor(new Sensor("nozzle_position_x", "mm", 0, 0, 610));
    $nozzle->addSensor(new Sensor("nozzle_position_y", "mm", 0, 0, 610));
    $printer->addPart($nozzle);
}

/**
 * Makes 4 generic motor parts and adds typical sensors to each one
 */
function makeMotors(Printer &$printer, array $vendors, array $params) {
    $m_names = array("x_motor", "y_motor", "bed_motor", "feed_motor");
    foreach ($m_names as $m_name) {
        $motor = new Part($m_name, $vendors[0]);
        $motor->addParam(array($params[4], 6.35));
        $motor->addParam(array($params[5], 1.8));
        $motor->addParam(array($params[6], .6));
        $motor->addParam(array($params[7], 6.35));
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
function makeChamber(Printer &$printer, array $vendors, $params) {
    $chamber = new Part("chamber", $vendors[rand(0, count($vendors)-1)]);
    $chamber->addParam(array($params[8], 302580));
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
function insertSecondaryTables($employees, $roles, $printers, $mats) {
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
                array_push($rows, array($param[0]->getID(), $part->getID(), $param[1]));
            }
        }
        $query = makeInsertQuery("Part_Parameters", array(), $rows);
        $conn->query($query);
    }

    addMaintenanceLogs($printers, $conn);
    addPrintJobs($printers, $mats, $conn);

    $conn->close();
}

function addMaintenanceLogs(array $printers, mysqli $conn) {
    $notes = array("Cleaned part surreptiously", "Removed someone's food from part",
    "It was late. I was tired. I know I shouldn't have left my sandwhich on there, but when I realized my mistake it was too late.",
    "It was the best of times, it was the worst of times. But mostly the worst of times lets be honest.",
    "The printer was squealing so I sprayed it with WD-40.",
    "Part was corrupted by Y2K", "Found my SSN written on the part in sharpie. Not sure why, but had to cover it up.",
    "Cleanup of unfortunate accident involving Bingo, -ingo, -ngo, -go, and, what's his name? -o",
    "Replaced the entire part. It's better this way.", "Cleanliness is close to godliness",
    "This part was haunted. Dave was convinced. Sal was convinced. Jess wasn't convinced, until she saw the blood. So Dave replaced the part. RIP Dave.",
    "Corroded due to sprinkler system being triggered by that one super humid day.",
    "Tried and failed to find a way to fix this part. Please accept this as my 2 weeks notice.",
    "Removed debris from around part.", "This part is constantly breaking. So constant, the derivative of it breaking is 0.",
    "Roughly 18 hours prior to the incident, an Amazon package containing fireworks was mistakenly delivered to the reactor control room and left under the console.
    The next day, at approximately 14:00, Technician A arrived at the facility with a bag containing four juggling pins. At 14:20, Technician A entered the control room, and joined Technician B at the console.
    At 14:28, Technician C exited the elevator and approached the control room holding a birthday cake intended for Technician B.
    At 14:29:22, Technician A said \"Hey [Technician B], check out this cool trick I learned\" while taking out the juggling pins. Technician B turned to look just as, at 14:29:26, Technician C entered holding the cake.");

    $times = array("2023-01-03 13:23:45", "2023-02-03 16:33:45", "2023-01-31 12:03:15",
    "2023-01-12 10:11:43", "2023-03-20 14:08:59", "2023-04-24 15:22:51", "2023-04-24 14:53:45", "2023-01-03 13:25:45", "2023-02-04 9:00:01", "2023-01-31 12:03:20",
    "2023-01-12 10:12:21", "2023-03-23 9:12:20", "2023-04-24 15:23:40", "2023-04-24 14:59:33", "2023-01-03 13:54:40", "2023-02-04 10:36:35", "2023-01-31 19:29:52",
    "2023-01-12 12:40:12", "2023-03-23 13:09:18", "2023-04-24 16:28:31", "2023-04-24 18:02:44");
    
    foreach ($printers as $printer) {
        $parts = $printer->parts;
        $mlog_cols = array("employee_ID", "timestamp", "notes");

        $cap = rand(5, 10);
        for ($i=0; $i<5; $i++) {
            $employee_id = rand(0, 5);
            $note = $notes[rand(0, count($notes)-1)];
            $timestamp = $times[rand(0, count($times)-1)];
            $values = array($employee_id, $timestamp, $note);
            $query = makeInsertQuery("Maintenance_Log", $mlog_cols, array($values));
            $conn->query($query);
            $result = $conn->query("SELECT last_insert_id();"); // Get recently inserted pk
            $mlog_ID = $result->fetch_all(MYSQLI_NUM)[0][0]; // Grab pk

            $cap2 = rand(1, 4);
            for ($i=0; $i<$cap2; $i++) {
                $part_id = $parts[rand(0, count($parts)-1)]->part_id;
                $query = makeInsertQuery("Part_Has_Maintenance_Log", array("part_ID", "mlog_ID"), array(array($part_id, $mlog_ID)));
                $conn->query($query);
            }
        }
    }
}

function addPrintJobs(array $printers, array $mats, mysqli $conn) {
    $notes = array("Print succeeded", "Print had some errors", "Print failed due to lack of support",
    "Print succeeded", "Print succeeded", "Print failed due to printer error");
    $submit_times = array("2023-01-03 13:23:45", "2023-02-03 16:33:45", "2023-01-31 12:03:15",
    "2023-01-12 10:11:43", "2023-03-20 14:08:59", "2023-04-24 15:22:51", "2023-04-24 14:53:45");
    $start_times = array("2023-01-03 13:25:45", "2023-02-04 9:00:01", "2023-01-31 12:03:20",
    "2023-01-12 10:12:21", "2023-03-23 9:12:20", "2023-04-24 15:23:40", "2023-04-24 14:59:33");
    $end_times = array("2023-01-03 13:54:40", "2023-02-04 10:36:35", "2023-01-31 19:29:52",
    "2023-01-12 12:40:12", "2023-03-23 13:09:18", "2023-04-24 16:28:31", "2023-04-24 18:02:44");
    $volumes = array("101", "156", "534", "378", "180", "602");
    $files = array("Jig (Kherissa)", "AWWT1991 v0.3", "Insert (Kherissa)", "AWWT1848 v0.2 1_2", "AWWT1848 v0.2 2_2", "full test");

    $cols = array("model", "code", "designer_ID", "curator_ID", "preparer_ID", "printer_ID",
                       "mat_ID", "job_succeeded", "in_queue", "print_volume", "submission_time", 
                       "print_finish_time", "print_start_time", "print_report");
    $values = array();
    for ($i=0; $i<count($files); $i++) {
        $note = $notes[rand(0, count($notes)-1)];
        $submit = $submit_times[$i];
        $start = $start_times[$i];
        $end = $end_times[$i];
        $vol = $volumes[$i];
        $model = $files[$i].".stl";
        $gcode = $files[$i].".gcode";
        $des = rand(1, 5);
        $cura = rand(1, 5);
        $prep = rand(1, 5);
        $succeed = ($note == 'Print Succeeded') ? 1 : 0;
        $printer = $printers[rand(0, count($printers)-1)];
        $mat = $mats[rand(0, count($mats)-1)];
        array_push($values, array($model, $gcode, $des, $cura, $prep, $printer->getID(), $mat->getID(),
                        $succeed, 0, $vol, $submit, $end, $start, $note));
    }
    $query = makeInsertQuery("Print_Job", $cols, $values);

    $conn->query($query);
}
?>