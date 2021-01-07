<?php
include('log.php');
require_once "connect.php";

    if (isset($_POST['project_id']) && isset($_POST['ps_AFM'])) {

        $project_id = $_POST["project_id"];
        $ps_AFM = $_POST["ps_AFM"];
   
        $sql = "UPDATE `conflicts` SET `status`= 'approved' WHERE `project_id`= $project_id AND ps_AFM = $ps_AFM";       
   
        mysqli_query($conn,$sql);

        $message = "Set conflict with id = " . $project_id . " ps_AFM " . $ps_AFM . " status to approved";
        logAction($message, $conn);



        header('Location: email_sent_change_coi_status.php');


     }
