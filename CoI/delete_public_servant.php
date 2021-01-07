<?php
include('log.php');
// Process delete operation after confirmation
if(isset($_POST["ps_AFM"] ) && !empty($_POST["ps_AFM"])&&(isset($_POST["project_id"] ) && !empty($_POST["project_id"]))){
    // Include config file
    require_once "connect.php";
    
    // Prepare a delete statement
    $sql = "DELETE FROM public_servants WHERE ps_AFM = ? AND project_id = ?";
    
    if($stmt = mysqli_prepare($conn, $sql)){
        // Bind variables to the prepared statement as parameters
        mysqli_stmt_bind_param($stmt, "ii", $param_ps_AFM, $param_project_id);
        
        // Set parameters
        $param_ps_AFM = trim($_POST["ps_AFM"]);
        $param_project_id = trim($_POST["project_id"]);
        
        // Attempt to execute the prepared statement
        if(mysqli_stmt_execute($stmt)){
            // Records deleted successfully. Redirect to landing page
            $message = "Deleted public servant " . $param_ps_AFM . " assigned on project = " .$project_id . " from database.";
            logAction($message, $conn);
            header("location: view_public_servants_GO.php");
            exit();
        } else{
            echo "Oops! Something went wrong. Please try again later.";
        }
    }
     
    // Close statement
    mysqli_stmt_close($stmt);
    
    // Close connection
    mysqli_close($conn);
} 
else{
    // Check existence of id parameter
    if(empty(trim($_GET["ps_AFM"]))){
        // URL doesn't contain id parameter. Redirect to error page
        echo("No AFM parameter");
        exit();
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Record</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        .wrapper{
            width: 500px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    
    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-header">
                        <h1>Delete Record</h1>
                    </div>
                    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                        <div class="alert alert-danger fade in">
                            <input type="hidden" name="ps_AFM" value="<?php echo trim($_GET["ps_AFM"]); ?>"/>
                            <input type="hidden" name="project_id" value="<?php echo trim($_GET["project_id"]); ?>"/>
                            <p>Are you sure you want to delete this record?</p><br>
                            <p>
                                <input type="submit" value="Yes" class="btn btn-danger">
                                <a href="view_public_servants_GO.php" class="btn btn-default">No</a>
                            </p>
                        </div>
                    </form>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>