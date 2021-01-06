<?php include('header.php');
include('connect.php');
include('redirect_GO.php');
include('log.php');
?>


<?php


// Define variables and initialize with empty values
$ps_AFM = $project_id = $ps_role = "";
$ps_AFM_err = $project_id_err = $ps_role_err = "";

// Processing form data when form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    if (isset($_POST["ps_AFM"]) && !empty($_POST["ps_AFM"])) {
        // Get hidden input value
        $ps_AFM = $_POST["ps_AFM"];
    }


    $input_ps_role = trim($_POST["ps_role"]);
    if (empty($input_ps_role)) {
        $ps_role = "Please enter the Public Servant name.";
    } else {
        $ps_role = $input_ps_role;
    }
    if (isset($_POST["project_id"]) && !empty($_POST["project_id"])) {
        // Get hidden input value
        $project_id = $_POST["project_id"];
    }




    // Check input errors before inserting in database
    if (empty($ps_AFM_err) && empty($project_id_err) && empty($ps_role_err)) {
        // Prepare an insert statement
        $sql = "INSERT INTO public_servants (ps_AFM, project_id, ps_role) VALUES (?, ?, ?)";

        if ($stmt = mysqli_prepare($conn, $sql)) {
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "sss", $param_ps_AFM, $param_project_id, $param_ps_role);

            // Set parameters

            $param_ps_AFM = $ps_AFM;
            $param_project_id = $project_id;
            $param_ps_role = $ps_role;

            // Attempt to execute the prepared statement
            if (mysqli_stmt_execute($stmt)) {
                $message = "Inserted ". $ps_AFM ." into the public servants table";
                logAction($message, $conn);
                header("location:email_sent.php");
                exit();
            } else {
                echo "Public servant is already assigned to this project.";
            }
        }
        // Close statement
        mysqli_stmt_close($stmt);
    }

    // Close connection
    mysqli_close($conn);
}
?>

<?php
include('navbar_GO.php');
?>

<style type="text/css">
    .wrapper {
        width: 500px;
        margin: 0 auto;
    }
</style>


<body>
    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-header">
                        <h2>Assign Public Servant</h2>
                    </div>
                    <p>Please fill this form and submit to assing a public servant to a project.</p>
                    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                        <?php
                        $sql = "SELECT * FROM users WHERE user_type = 'PS' ORDER BY name";
                        $result = $conn->query($sql); ?>
                        <div class="form-group <?php echo (!empty($ps_AFM_err)) ? 'has-error' : ''; ?>">
                            <label>Public Servant Name</label>
                            <select class="browser-default custom-select" name='ps_AFM'>
                                <?php while ($rows = $result->fetch_assoc()) {
                                    $ps_name = $rows['name'];
                                    $ps_AFM = $rows['AFM'];
                                    echo ("<option value='$ps_AFM'>$ps_name</option>");
                                } ?>
                            </select>
                        </div>
                        <div class="form-group <?php echo (!empty($stakeholder_role_err)) ? 'has-error' : ''; ?>">
                            <label>Public Servant Role</label>
                            <input type="text" name="ps_role" class="form-control" value="<?php echo $ps_role; ?>">
                            <span class="help-block"><?php echo $ps_role_err; ?></span>
                        </div>
                        <?php
                        $sql = "SELECT * FROM projects ORDER BY project_name";
                        $result = $conn->query($sql); ?>
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