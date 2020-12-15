<?php include('header.php');
include('connect.php');
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
?>


<?php


// Define variables and initialize with empty values
$ps_AFM = $project_id = $ps_role = "";
$ps_AFM_err = $project_id_err = $ps_role_err = "";

// Processing form data when form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate project name
    if (isset($_POST["ps_AFM"]) && !empty($_POST["ps_AFM"])) {
        // Get hidden input value
        $ps_AFM = $_POST["ps_AFM"];
    }

    // Validate start date
    $input_ps_role = trim($_POST["ps_role"]);
    if (empty($input_ps_role)) {
        $ps_role = "Please enter the Stakeholder name.";
    } else {
        $ps_role = $input_ps_role;
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
                // Records created successfully. Redirect to landing page
                header("location:view_public_servants_GO.php");
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


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Conflicts of Interest</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <span class="navbar-text">
        Government Official:
        <?php echo $_SESSION["name"];?>
    </span>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Projects
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="projects_GO.php">View Projects</a>
                    <a class="dropdown-item" href="create_project.php">Create New Project</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="conflicts.php">Conflicts of Interest</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Users
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="view_users_GO.php">View Users</a>
                    <a class="dropdown-item" href="register.php">Register User</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Public Servants
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="view_public_servants_GO.php">View Pulic Servants</a>
                    <a class="dropdown-item" href="add_public_servant_GO.php">Add New Public Servant</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Firm Representatives
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="view_firm_representatives_GO.php">View Firm Representatives</a>
                    <a class="dropdown-item" href="add_firm_representative_GO.php">Add New Firm Representative</a>
                </div>
            </li>

        </ul>
        <form class="form-inline my-2 my-lg-0" method="post" action="logout.php" id="logoutform">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="logout-btn">Log Out</button>
        </form>
    </div>
</nav>

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
                        <h2>Add Public Servant</h2>
                    </div>
                    <p>Please fill this form and submit to add a new public servant to the database.</p>
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
                        $sql = "SELECT * FROM projects";
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