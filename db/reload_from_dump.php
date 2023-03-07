<?php
    include '../php/functions.php';
    $db = connectToServer();
    $db->query('CREATE DATABASE IF NOT EXISTS Mocko_Ex');
    $db->query('USE Mocko_Ex');
    $db->query('source db_dump.sql');

    $db->close();
?>