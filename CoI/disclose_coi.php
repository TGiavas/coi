<?php
include('header.php');
// Include config file
require_once "connect.php";

// Define variables and initialize with empty values
$project_id = $ps_id = $coi_description = "";
$project_id_err = $ps_id_err = $coi_description_err = "";

// Processing form data when form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate project name
    $input_project_id= trim($_POST["project_id"]);
    if (empty($input_project_id)) {
        $project_id_err = "Please enter a project id.";
    } else {
        $project_id = $input_project_id;
    }

    // Validate project_des
    $input_ps_id = trim($_POST["PS_id"]);
    if (empty($input_ps_id)) {
        $ps_id_err = "Please enter the public servant id.";
    } else {
        $ps_id = $input_ps_id;
    }

    // Validate usertype
    $input_coi_description = trim($_POST["coi_description"]);
    if (empty($input_coi_description)) {
        $coi_description_err = "Please enter conflict of interest description.";
    } else {
        $coi_description = $input_coi_description;
    }


    // Check input errors before inserting in database
    if (empty($project_name_err) && empty($PS_name_err) && empty($coi_description_err) ){
        // Prepare an insert statement
        $sql = "INSERT INTO conflicts (project_id, ps_id, coi_description) VALUES (?, ?, ?)";

        if ($stmt = mysqli_prepare($conn, $sql)) {
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "sss", $param_project_id, $param_ps_id, $param_coi_description);

            // Set parameters
            $param_project_id = $project_id;
            $param_ps_id = $ps_id;
            $param_coi_description = $coi_description;

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
    </style>
</head>

<body>
    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-header">
                        <h2>Announce Conflict of Interest</h2>
                    </div>
                    <p>Please fill this form and submit to announce a conflict of interest to the government official.</p>
                    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                        <div class="form-group <?php echo (!empty($project_id_err)) ? 'has-error' : ''; ?>">
                            <label>Project ID</label>
                            <input type="text" name="project_id" class="form-control" value="<?php echo $project_id; ?>">
                            <span class="help-block"><?php echo $project_id_err; ?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($PS_name_err)) ? 'has-error' : ''; ?>">
                            <label>Public Servant ID</label>
                            <input type = "text" name="ps_id" class="form-control"><?php echo $ps_id; ?>
                            <span class="help-block"><?php echo $ps_id_err; ?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($coi_description_err)) ? 'has-error' : ''; ?>">
                            <label>Conflict of Interest description</label>
                            <input type="text" name="coi_description" class="form-control"><?php echo $coi_description; ?>
                            <span class="help-block"><?php echo $coi_description_err; ?></span>
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