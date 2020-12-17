<?php include('header.php');
include('connect.php');
include('redirect_GO.php');
include('log.php');
?>


<?php

// Define variables and initialize with empty values
$firm_name = "";
$firm_name_err = "";


// Processing form data when form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $input_firm_name = trim($_POST["firm_name"]);
    if (empty($input_firm_name)) {
        $firm_name_err = "Please enter a project name.";
    } else {
        $firm_name = $input_firm_name;
    }
    // Check input errors before inserting in database
    if (empty($firm_name_err)) {
        // Prepare an insert statement
        $sql = "INSERT INTO firms (firm_name) VALUES(?)";
        if ($stmt = mysqli_prepare($conn, $sql)) {
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "s", $firm_name);
            $param_firm_name = $firm_name;
            // Attempt to execute the prepared statement
            if (mysqli_stmt_execute($stmt)) {
                $message = "Inserted ". $firm_name . " into the firms table.";
                logAction($message, $conn);
                // Records created successfully. Redirect to landing page
                header("location:view_firms_GO.php");
                exit();
            } else {
                echo "Something went wrong. Please try again later.";
            }
        }
        // Close statement
        mysqli_stmt_close($stmt);
    }

    // Close connection
    mysqli_close($conn);
}
?>

<?php include('navbar_GO.php') ?>

<style type="text/css">
    .wrapper {
        width: 500px;
        margin: 0 auto;
    }
</style>



<div class="wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="page-header">
                    <h2>Add Firm</h2>
                </div>
                <p>Please fill this form and submit to add a new firm representative to the database.</p>
                <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                    <div class="form-group <?php echo (!empty($firm_name_err)) ? 'has-error' : ''; ?>">
                        <label>Firm Name</label>
                        <input type="text" name="firm_name" class="form-control" value="<?php echo $firm_name; ?>">
                        <span class="help-block"><?php echo $firm_name_err; ?></span>
                    </div>

                    <input type="submit" class="btn btn-primary" value="Submit">
                    <a href="projects_FR.php" class="btn btn-default">Cancel</a>
                </form>
            </div>
        </div>
    </div>
</div>










<?php include('footer.php') ?>



</body>

</html>