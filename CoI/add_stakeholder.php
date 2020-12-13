<?php
include('header.php');
include('connect.php');
?>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Conflicts of Interest</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <span class="navbar-text">
        Firm Representative:
        <?php echo $_SESSION["AFM"]; ?>
    </span>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Projects
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="projects_FR.php">View All Projects</a>
                    <a class="dropdown-item" href="applied_projects_FR.php">View Applied Projects</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Stakeholders
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="firm_stakeholders.php">View Firm Stakeholders</a>
                    <a class="dropdown-item" href="add_stakeholder.php">Add New Stakeholder</a>
                </div>
            </li>

        </ul>
        <form class="form-inline my-2 my-lg-0" method="post" action="logout.php" id="logoutform">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="logout-btn">Log Out</button>
        </form>
    </div>
</nav>

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
    $input_stakeholder_AFM = trim($_POST["stakeholder_AFM"]);
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
    if (isset($_POST["project_id"]) && !empty($_POST["project_id"])) {
        // Get hidden input value
        $project_id = $_POST["project_id"];
    }

    // // Validate usertype
    // $input_public_servants = trim($_POST["public_servants"]);
    // if (empty($input_public_servants)) {
    //     $public_servants_err = "Please enter the public servants.";
    // } else {
    //     $public_servants = $input_public_servants;
    // }

    $firm_id = 1;

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
                        $sql = "SELECT * FROM firms_projects INNER JOIN projects ON firms_projects.project_id = projects.project_id WHERE firm_id = 1 ";
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
                        <!-- <div class="form-group <?php echo (!empty($project_id)) ? 'has-error' : ''; ?>">
                            <label>Project ID</label>
                            <input type="text" name="project_id" class="form-control"><?php echo $project_id; ?>
                            <span class="help-block"><?php echo $project_id_err; ?></span>
                        </div> -->
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