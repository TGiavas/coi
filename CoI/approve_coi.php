<?php
include('log.php');
require_once "connect.php";

    if (isset($_POST['conflict_id'])) {

        $conflict_id = $_POST["conflict_id"];
   
        $sql = "UPDATE `conflicts` SET `status`= 'approved' WHERE `conflict_id`= $conflict_id";       
   
        mysqli_query($conn,$sql);

        $message = "Set conflict with id = " . $conflict_id . " status to approved";
        logAction($message, $conn);



        header('Location: conflicts.php');


     }
