<?php
include('header.php');
include('connect.php');
include('redirect_FR.php');
include('navbar_FR.php');
include('log.php');

?>


<?php
//error_reporting(0);
// Include config file
require_once "connect.php";

// Define variables and initialize with empty values
$stakeholder_AFM = $stakeholder_name = $stakeholder_role = $project_id = "";
$stakeholder_AFM_err = $stakeholder_name_err = $stakeholder_role_err = $project_id_err = "";


$sql = "SELECT * FROM users INNER JOIN firm_representatives ON users.AFM = firm_representatives.fr_AFM";
$result = $conn->query($sql); 
$firm_id = "";
while ($rows = $result->fetch_assoc()) {
  $firm_id = $rows['firm_id'];
}



if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate project name
    $input_stakeholder_AFM = trim($_POST["stakeholder_AFM"]);
    if (empty($input_stakeholder_AFM)) {
        $stakeholder_AFM_err = "Please enter Stakeholder Name.";
    } else {
        $stakeholder_AFM = $input_stakeholder_AFM;
    }

  
    $input_stakeholder_name = trim($_POST["stakeholder_name"]);
    if (empty($input_stakeholder_name)) {
        $stakeholder_name = "Please enter the Stakeholder name.";
    } else {
        $stakeholder_name = $input_stakeholder_name;
    }


    $input_stakeholder_role = trim($_POST["stakeholder_role"]);
    if (empty($input_stakeholder_role)) {
        $stakeholder_role = "Please enter the Stakeholder role.";
    } else {
        $stakeholder_role = $input_stakeholder_role;
    }

    if (isset($_POST["project_id"]) && !empty($_POST["project_id"])) {
        // Get hidden input value
        $project_id = $_POST["project_id"];
    }



    // Check input errors before inserting in database
    if (empty($stakeholder_AFM_err) && empty($project_id_err) && empty($stakeholder_name_err) && empty($stakeholder_role_err)) {
        // Prepare an insert statement
        $sql = "INSERT INTO firm_stakeholders (stakeholder_AFM, stakeholder_name, firm_id, stakeholder_role, project_id) VALUES (?, ?, ?, ?, ?)";

        if ($stmt = mysqli_prepare($conn, $sql)) {
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "sssss", $param_stakeholder_AFM, $param_stakeholder_name, $firm_id, $param_stakeholder_role, $param_project_id);

            // Set parameters
            $param_stakeholder_AFM = $stakeholder_AFM;
            $param_stakeholder_name = $stakeholder_name;
            $param_stakeholder_role = $stakeholder_role;
            $param_project_id = $project_id;



            // Attempt to execute the prepared statement
            if (mysqli_stmt_execute($stmt)) {
                $message = "Inserted ". $stakeholder_AFM ." into the stakeholders table";
                logAction($message, $conn);
                header("location: firm_stakeholders.php");
                exit();
            } else {
                echo "Stakeholder is already assigned in this project";
            }
        }

        // Close statement
        mysqli_stmt_close($stmt);
    }

    // Close connection
    mysqli_close($conn);
}
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
                        <h2>Add New Stakeholder</h2>
                    </div>
                    <p>Please fill this form and submit to add a new stakeholder to the database.</p>
                    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                        <div class="form-group <?php echo (!empty($stakeholder_AFM_err)) ? 'has-error' : ''; ?>">
                            <label>Stakeholder ΑΦΜ</label>
                            <input type="text" name="stakeholder_AFM" class="form-control" value="<?php echo $stakeholder_AFM; ?>">
                            <span class="help-block"><?php echo $stakeholder_AFM_err; ?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($stakeholder_name_err)) ? 'has-error' : ''; ?>">
                            <label>Stakeholder Name</label>
                            <input type="text" name="stakeholder_name" class="form-control" value="<?php echo $stakeholder_name; ?>">
                            <span class="help-block"><?php echo $stakeholder_name_err; ?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($stakeholder_role_err)) ? 'has-error' : ''; ?>">
                            <label>Stakeholder Role</label>
                            <input type="text" name="stakeholder_role" class="form-control" value="<?php echo $stakeholder_role; ?>">
                            <span class="help-block"><?php echo $stakeholder_role_err; ?></span>
                        </div>
                        <?php
                        $sql = "SELECT * FROM firms_projects INNER JOIN projects ON firms_projects.project_id = projects.project_id WHERE firm_id = $firm_id ";
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