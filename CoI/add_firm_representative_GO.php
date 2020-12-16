<?php include('header.php');
include('connect.php');
?>


<?php


// Define variables and initialize with empty values
$fr_AFM = $firm_id = "";
$fr_AFM_err = $firm_id_err = "";

// Processing form data when form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate project name
    if (isset($_POST["fr_AFM"]) && !empty($_POST["fr_AFM"])) {
        // Get hidden input value
        $fr_AFM = $_POST["fr_AFM"];
    }


    // Validate project_des
    if (isset($_POST["firm_id"]) && !empty($_POST["firm_id"])) {
        // Get hidden input value
        $firm_id = $_POST["firm_id"];
    }

    // // Validate usertype
    // $input_public_servants = trim($_POST["public_servants"]);
    // if (empty($input_public_servants)) {
    //     $public_servants_err = "Please enter the public servants.";
    // } else {
    //     $public_servants = $input_public_servants;
    // }


    // Check input errors before inserting in database
    if (empty($fr_AFM_err) && empty($fr_id_err)) {
        // Prepare an insert statement
        $sql = "INSERT INTO firm_representatives (fr_AFM, firm_id) VALUES (?, ?)";

        if ($stmt = mysqli_prepare($conn, $sql)) {
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "ss", $param_fr_AFM, $param_firm_id);

            // Set parameters

            $param_fr_AFM = $fr_AFM;
            $param_firm_id = $firm_id;

            // Attempt to execute the prepared statement
            if (mysqli_stmt_execute($stmt)) {
                // Records created successfully. Redirect to landing page
                header("location:view_firm_representatives_GO.php");
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


<?php include('navbar_GO.php')?>
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
                        <h2>Add Firm Representative</h2>
                    </div>
                    <p>Please fill this form and submit to add a new firm representative to the database.</p>
                    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                        <?php
                        $sql = "SELECT * FROM users WHERE user_type = 'FR' ORDER BY name";
                        $result = $conn->query($sql); ?>
                        <div class="form-group <?php echo (!empty($fr_AFM_err)) ? 'has-error' : ''; ?>">
                            <label>Firm Representative Name</label>
                            <select class="browser-default custom-select" name='fr_AFM'>
                                <?php while ($rows = $result->fetch_assoc()) {
                                    $fr_name = $rows['name'];
                                    $fr_AFM = $rows['AFM'];
                                    echo ("<option value='$fr_AFM'>$fr_name</option>");
                                } ?>
                            </select>
                        </div>

                        <?php
                        $sql = "SELECT * FROM firms";
                        $result = $conn->query($sql); ?>
                        <div class="form-group <?php echo (!empty($fr_AFM_err)) ? 'has-error' : ''; ?>">
                            <label>Firm</label>
                            <select class="browser-default custom-select" name='firm_id'>
                                <?php while ($rows = $result->fetch_assoc()) {
                                    $firm_name = $rows['firm_name'];
                                    $firm_id = $rows['firm_id'];
                                    echo ("<option value='$firm_id'>$firm_name</option>");
                                } ?>
                            </select>
                        </div>
                        <!-- <div class="form-group <?php echo (!empty($firm_id)) ? 'has-error' : ''; ?>">
                            <label>Project ID</label>
                            <input type="text" name="firm_id" class="form-control"><?php echo $firm_id; ?>
                            <span class="help-block"><?php echo $fr_AFM_err; ?></span>
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