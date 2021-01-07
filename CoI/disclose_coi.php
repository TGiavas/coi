<?php 
include('header.php');
include('connect.php');
include('redirect_PS.php');
include('log.php');
?>


<?php

// Define variables and initialize with empty values
$project_id = $ps_AFM = $coi_description = "";
$project_id_err = $ps_AFM_err = $coi_description_err = "";
$status = "pending";
$AFM = $_SESSION['AFM'];

// Processing form data when form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate project name
    if (isset($_POST["project_id"]) && !empty($_POST["project_id"])) {
        // Get hidden input value
        $project_id = $_POST["project_id"];
    }

    // Validate usertype
    $input_coi_description = trim($_POST["coi_description"]);
    if (empty($input_coi_description)) {
        $coi_description_err = "Please enter conflict of interest description.";
    } else {
        $coi_description = $input_coi_description;
    }


    // Check input errors before inserting in database
    if (empty($project_name_err) && empty($PS_name_err) && empty($coi_description_err)) {
        // Prepare an insert statement
        $sql = "INSERT INTO conflicts (project_id, ps_AFM, coi_description, status) VALUES (?, ?, ?, ?)";

        if ($stmt = mysqli_prepare($conn, $sql)) {
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "ssss", $param_project_id, $param_ps_AFM, $param_coi_description, $param_status);

            // Set parameters
            $param_project_id = $project_id;
            $param_ps_AFM = $AFM;
            $param_coi_description = $coi_description;
            $param_status = $status;

            // Attempt to execute the prepared statement
            if (mysqli_stmt_execute($stmt)) {
                // Records created successfully. Redirect to landing page
                $message = "Disclosed conflict of interest \"" . $coi_description . "\" for project with id = " .$project_id;
                logAction($message, $conn);
                header("location: email_sent_disclose_coi.php");
                exit();
            } else {
                echo "You have already disclosed a conflict for this project";
            }
        }

        // Close statement
        mysqli_stmt_close($stmt);
    }

    // Close connection
    mysqli_close($conn);
}
?>

<?php include('navbar_PS.php'); ?>

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
                    <h2>Disclose Conflict of Interest</h2>
                </div>
                <p>Please fill this form and submit to disclose a conflict of interest to the government official.</p>
                <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                    <!-- <div class="form-group <?php echo (!empty($project_id_err)) ? 'has-error' : ''; ?>">
                        <label>Project ID</label>
                        <input type="text" name="project_id" class="form-control" value="<?php echo $project_id; ?>">
                        <span class="help-block"><?php echo $project_id_err; ?></span>
                    </div> -->
                    <div class="form-group <?php echo (!empty($PS_AFM_err)) ? 'has-error' : ''; ?>">
                        <input type="text" hidden value=<?php echo $_SESSION['AFM'] ?> name="ps_AFM" class="form-control"><?php echo $ps_AFM; ?>
                        <span class="help-block"><?php echo $ps_AFM_err; ?></span>
                    </div>
                    <?php require('connect.php');
                    $AFM = $_SESSION['AFM'];
                    $sql = "SELECT * FROM public_servants INNER JOIN projects ON projects.project_id = public_servants.project_id WHERE ps_AFM = $AFM ";
                    $result = $conn->query($sql);
                    ?>
                    <div class="form-group <?php echo (!empty($project_id_err)) ? 'has-error' : ''; ?>">
                        <label>Project Name</label>
                        <select class="browser-default custom-select" name='project_id'>
                            <?php while ($rows = $result->fetch_assoc()) {
                                $project_name = $rows['project_name'];
                                $project_id = $rows['project_id'];
                                echo ("<option value='$project_id'>$project_name</option>");
                            } ?>
                        </select>
                    </div>
                    <div class="form-group <?php echo (!empty($coi_description_err)) ? 'has-error' : ''; ?>">
                        <label>Conflict of Interest description</label>
                        <input type="text" name="coi_description" class="form-control"><?php echo $coi_description; ?>
                        <span class="help-block"><?php echo $coi_description_err; ?></span>
                    </div>
                    <input type="submit" class="btn btn-primary" value="Submit">
                    <a href="projects_PS.php" class="btn btn-default">Cancel</a>
                </form>
            </div>
        </div>
    </div>
</div>

<?php include('footer.php') ?>
</body>

</html>