<?php
// Include config file
require_once "connect.php";

// Define variables and initialize with empty values
$project_name = $project_start_date = $project_end_date = $project_desc = "";
$project_name_err = $project_start_date_err = $project_end_date_err = $project_desc_err = "";

// Processing form data when form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate project name
    $input_project_name= trim($_POST["project_name"]);
    if (empty($input_project_name)) {
        $project_name_err = "Please enter a project name.";
    } else {
        $project_name = $input_project_name;
    }

    // Validate start date
    $input_project_start_date = trim($_POST["project_start_date"]);
    if (empty($input_project_start_date)) {
        $project_start_date = "Please enter the project start date.";
    } else {
        $project_start_date = $input_project_start_date;
    }

    // Validate end date
    $input_project_end_date = trim($_POST["project_end_date"]);
    if (empty($input_project_end_date)) {
        $project_end_date = "Please enter the project end date.";
    } else {
        $project_end_date = $input_project_end_date;
    }
    
    // Validate project_des
    $input_project_desc = trim($_POST["project_desc"]);
    if (empty($input_project_desc)) {
        $project_desc_error = "Please enter the project description.";
    } else {
        $project_desc = $input_project_desc;
    }

    // // Validate usertype
    // $input_public_servants = trim($_POST["public_servants"]);
    // if (empty($input_public_servants)) {
    //     $public_servants_err = "Please enter the public servants.";
    // } else {
    //     $public_servants = $input_public_servants;
    // }


    // Check input errors before inserting in database
    if (empty($project_name_err) && empty($project_desc_err) && empty($project_start_date_err) && empty($project_end_date_err) ){
        // Prepare an insert statement
        $sql = "INSERT INTO projects (project_name, project_start_date, project_end_date, project_desc) VALUES (?, ?, ?, ?)";

        if ($stmt = mysqli_prepare($conn, $sql)) {
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "ssss", $param_project_name, $param_project_start_date, $param_project_end_date, $param_project_desc);

            // Set parameters
            $param_project_name = $project_name;
            $param_project_start_date = $project_start_date;
            $param_project_end_date = $project_end_date;
            $param_project_desc = $project_desc;
            


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
                    <p>Please fill this form and submit to add a new project to the database.</p>
                    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                        <div class="form-group <?php echo (!empty($project_name_err)) ? 'has-error' : ''; ?>">
                            <label>Project Name</label>
                            <input type="text" name="project_name" class="form-control" value="<?php echo $project_name; ?>">
                            <span class="help-block"><?php echo $project_name_err; ?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($project_start_date_err)) ? 'has-error' : ''; ?>">
                            <label>Project Start Date</label>
                            <input type="date" name="project_start_date" class="form-control" value="<?php echo $project_start_date; ?>">
                            <span class="help-block"><?php echo $project_start_date_err; ?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($project_end_date_err)) ? 'has-error' : ''; ?>">
                            <label>Project End Date</label>
                            <input type="date" name="project_end_date" class="form-control" value="<?php echo $project_end_date; ?>">
                            <span class="help-block"><?php echo $project_end_date_err; ?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($project_desc)) ? 'has-error' : ''; ?>">
                            <label>Project Description</label>
                            <input type = "text" name="project_desc" class="form-control"><?php echo $project_desc; ?>
                            <span class="help-block"><?php echo $project_desc_err; ?></span>
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