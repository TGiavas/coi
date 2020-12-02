<?php
//error_reporting(0);
// Include config file
require_once "connect.php";

// Define variables and initialize with empty values
$stakeholder_AFM = $stakeholder_name = $stakeholder_role = $project_id = "";
$stakeholder_AFM_err = $stakeholder_name_err = $stakeholder_role_err = $project_id_err = "";

// Processing form data when form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate project name
    $input_stakeholder_AFM= trim($_POST["stakeholder_AFM"]);
    if (empty($input_stakeholder_AFM)) {
        $stakeholder_AFM_err = "Please enter Stakeholder Name.";
    } else {
        $stakeholder_AFM = $input_stakeholder_AFM;
    }

    // Validate start date
    $input_stakeholder_name = trim($_POST["stakeholder_name"]);
    if (empty($input_stakeholder_name)) {
        $stakeholder_name = "Please enter the Stakeholder name.";
    } else {
        $stakeholder_name = $input_stakeholder_name;
    }

    // Validate end date
    $input_stakeholder_role = trim($_POST["stakeholder_role"]);
    if (empty($input_stakeholder_role)) {
        $stakeholder_role = "Please enter the Stakeholder role.";
    } else {
        $stakeholder_role = $input_stakeholder_role;
    }

    // Validate project_des
    $input_project_id = trim($_POST["project_id"]);
    if (empty($input_project_id)) {
        $project_id_error = "Please enter the project id.";
    } else {
        $project_id = $input_project_id;
    }

    // // Validate usertype
    // $input_public_servants = trim($_POST["public_servants"]);
    // if (empty($input_public_servants)) {
    //     $public_servants_err = "Please enter the public servants.";
    // } else {
    //     $public_servants = $input_public_servants;
    // }

    $firm_id=1;

    // Check input errors before inserting in database
    if (empty($stakeholder_AFM_err) && empty($project_id_err) && empty($stakeholder_name_err) && empty($stakeholder_role_err) ){
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
                // Records created successfully. Redirect to landing page
                header("location: projects_FR.php");
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

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Create Record</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
    <style type="text/css">
        .wrapper {
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
                        <h2>Create Project</h2>
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
                        <div class="form-group <?php echo (!empty($project_id)) ? 'has-error' : ''; ?>">
                            <label>Project ID</label>
                            <input type = "text" name="project_id" class="form-control"><?php echo $project_id; ?>
                            <span class="help-block"><?php echo $project_id_err; ?></span>
                        </div>
                        <input type="submit" class="btn btn-primary" value="Submit">
                        <a href="projects_FR.php" class="btn btn-default">Cancel</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
