<?php 
include('header.php');
function logAction($message,$conn)
{
    $user = $_SESSION['AFM'];
    $sql = "INSERT INTO log (user_AFM, message) VALUES ($user, '$message')";
    $conn->query($sql);
    
}
