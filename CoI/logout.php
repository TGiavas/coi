<?php
include('log.php');
include('connect.php');

$AFM =$_SESSION["AFM"] ;
$message = $AFM . " has logged out.";
logAction($message, $conn);

// // Initialize the session
session_start();

// Unset all of the session variables
$_SESSION = array();
 
// Destroy the session.
session_destroy();


 
// Redirect to login page
header("location: login.php");
exit;
?>