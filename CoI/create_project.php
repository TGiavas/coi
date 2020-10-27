<?php
// Include config file
require_once "connect.php";

// Define variables and initialize with empty values
$project_name = $project_desc = $public_servants = "";
$project_name_err = $project_desc_err = $public_servants_err = "";

// Processing form data when form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate project name
    $input_project_name= trim($_POST["project_name"]);
    if (empty($input_project_name)) {
        $project_name_err = "Please enter a project name.";
    } else {
        $project_name = $input_project_name;
    }

    // Validate project_des
    $input_project_desc = trim($_POST["project_desc"]);
    if (empty($input_project_desc)) {
        $project_desc_error = "Please enter the project description.";
    } else {
        $project_desc = $input_project_desc;
    }

    // Validate usertype
    $input_public_servants = trim($_POST["public_servants"]);
    if (empty($input_public_servants)) {
        $public_servants_err = "Please enter the public servants.";
    } else {
        $public_servants = $input_public_servants;
    }


    // Check input errors before inserting in database
    if (empty($project_name_err) && empty($project_desc_err) && empty($public_servants_err) ){
        // Prepare an insert statement
        $sql = "INSERT INTO projects (project_name, project_desc, public_servants) VALUES (?, ?, ?)";

        if ($stmt = mysqli_prepare($conn, $sql)) {
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "sss", $param_project_name, $param_project_desc, $param_public_servants);

            // Set parameters
            $param_project_name = $project_name;
            $param_project_desc = $project_desc;
            $param_public_servants = $public_servants;

            // Attempt to execute the prepared statement
            if (mysqli_stmt_execute($stmt)) {
                // Records created successfully. Redirect to landing page
                header("location: projects_GO.php");
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
                    <p>Please fill this form and submit to add a new project to the database.</p>
                    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                        <div class="form-group <?php echo (!empty($project_name_err)) ? 'has-error' : ''; ?>">
                            <label>Project Name</label>
                            <input type="text" name="project_name" class="form-control" value="<?php echo $project_name; ?>">
                            <span class="help-block"><?php echo $project_name_err; ?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($project_desc)) ? 'has-error' : ''; ?>">
                            <label>Project Description</label>
                            <input type = "text" name="project_desc" class="form-control"><?php echo $project_desc; ?></textarea>
                            <span class="help-block"><?php echo $project_desc_err; ?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($public_servants_err)) ? 'has-error' : ''; ?>">
                            <label>Public Servants</label>
                            <input type="text" name="public_servants" class="form-control"><?php echo $public_servants; ?></textarea>
                            <span class="help-block"><?php echo $public_servants_err; ?></span>
                        </div>
                        <input type="submit" class="btn btn-primary" value="Submit">
                        <a href="index.php" class="btn btn-default">Cancel</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>