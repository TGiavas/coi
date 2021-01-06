<?php
include('log.php');
// Process delete operation after confirmation
if(isset($_POST["fr_AFM"]) && !empty($_POST["fr_AFM"])){
    // Include config file
    require_once "connect.php";
    
    // Prepare a delete statement
    $sql = "DELETE FROM firm_representatives WHERE fr_AFM = ?";
    
    if($stmt = mysqli_prepare($conn, $sql)){
        // Bind variables to the prepared statement as parameters
        mysqli_stmt_bind_param($stmt, "i", $param_fr_AFM);
        
        // Set parameters
        $param_fr_AFM = trim($_POST["fr_AFM"]);
        
        // Attempt to execute the prepared statement
        if(mysqli_stmt_execute($stmt)){
            // Records deleted successfully. Redirect to landing page
            $message = "Deleted ". $param_fr_AFM ." from the firm representatives table";
            logAction($message, $conn);
            header("location: view_firm_representatives_GO.php");
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
    if(empty(trim($_GET["fr_AFM"]))){
        // URL doesn't contain id parameter. Redirect to error page
        echo("No id parameter");
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
                            <input type="hidden" name="fr_AFM" value="<?php echo trim($_GET["fr_AFM"]); ?>"/>
                            <p>Are you sure you want to delete this record?</p><br>
                            <p>
                                <input type="submit" value="Yes" class="btn btn-danger">
                                <a href="view_firm_representatives_GO.php" class="btn btn-default">No</a>
                            </p>
                        </div>
                    </form>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>