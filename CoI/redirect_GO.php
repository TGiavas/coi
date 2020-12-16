<?php if(!(isset($_SESSION['user_type']))){
  header("location: login.php");
}
else if((isset($_SESSION['user_type']) && $_SESSION['user_type'] == "PS")){
    header("location: projects_PS.php");
}
else if((isset($_SESSION['user_type']) && $_SESSION['user_type'] == "FR")){
    header("location: projects_FR.php");
}
?>