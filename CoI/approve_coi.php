<?php
require_once "connect.php";


    if (isset($_POST['conflict_id'])) {

        $conflict_id = $_POST["conflict_id"];
   
        $sql = "UPDATE `conflicts` SET `status`= 'approved' WHERE `conflict_id`= $conflict_id";       
   
        mysqli_query($conn,$sql);
        header('Location: projects_GO.php');


     }
