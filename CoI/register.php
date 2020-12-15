<?php include('header.php');
include('connect.php');
require_once "config.php";
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
include('navbar_GO.php')
?>


<?php
$AFM = $name = $user_type = $password = $confirm_password = "";
$AFM_err = $name_err = $user_type_err = $password_err = $confirm_password_err = "";

// Define variables and initialize with empty values
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty(trim($_POST["AFM"]))) {
        $AFM_err = "Please enter an AFM.";
    } else {
        $AFM = trim($_POST["AFM"]);
    }


    if (empty(trim($_POST["name"]))) {
        $name_err = "Please enter a name.";
    } else {
        $name = trim($_POST["name"]);
    }


    // Validate password
    if (empty(trim($_POST["password"]))) {
        $password_err = "Please enter a password.";
    } elseif (strlen(trim($_POST["password"])) < 6) {
        $password_err = "Password must have atleast 6 characters.";
    } else {
        $password = trim($_POST["password"]);
    }

    // Validate confirm password
    if (empty(trim($_POST["confirm_password"]))) {
        $confirm_password_err = "Please confirm password.";
    } else {
        $confirm_password = trim($_POST["confirm_password"]);
        if (empty($password_err) && ($password != $confirm_password)) {
            $confirm_password_err = "Password did not match.";
        }
    }


    if (empty(trim($_POST['user_type']))) {
        $user_type_err = "Please enter a User Type.";
    } else {
        $user_type = $_POST['user_type'];
    }

    // Check input errors before inserting in database
    if (empty($name_err) && empty($password_err) && empty($confirm_password_err) && empty($AFM_err)) {

        // Prepare an insert statement
        $sql = "INSERT INTO users (AFM, name, password, user_type) VALUES (?,?,?,?)";

        if ($stmt = mysqli_prepare($link, $sql)) {
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "ssss", $param_AFM, $param_name, $param_password, $param_user_type);

            // Set parameters
            $param_AFM = $AFM;
            $param_name = $name;
            $param_password = password_hash($password, PASSWORD_DEFAULT); // Creates a password hash
            $param_user_type = $user_type;

            // Attempt to execute the prepared statement

            if (mysqli_stmt_execute($stmt)) {
                // Redirect to login page
                header("location: login.php");
            } else {
                echo "Something went wrong. Please try again later.";
            }

            // Close statement
            mysqli_stmt_close($stmt);
        }
    }

    // Close connection
    //
    //   mysqli_close($link);
}

?>



<div class="wrapper-register">
    <ul class="flex-container">
        <li class="flex-item-left">
            <div>
                <div>
                    <div>
                        <img src="assets/Application Logo.png" width="100%">
                    </div>
                    <p style="font-size:30px;"> Government Projects</p>
                    <p style="font-size: 15px;">Project Management System</p>
                    <br>
                    <p>A powerful, easy-to-use application for managing and applying for Government Projects.</p>
                </div>
            </div>
        </li>



        <li class="flex-item-right">
            <!-- Login Form window -->
            <div>
                <div>
                    <div>
                        <p style="font-size:30px; padding-bottom: 80px;"> Register New User</h1>
                    </div>
                    <!-- PHP Form -->
                    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
                        <div class="form-group <?php echo (!empty($AFM_err)) ? 'has-error' : ''; ?>">
                            <label>ΑΦΜ</label>
                            <input type="text" name="AFM" class="form-control" value="<?php echo $AFM; ?>">
                            <span class="help-block"><?php echo $AFM_err; ?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($name_err)) ? 'has-error' : ''; ?>">
                            <label>Name</label>
                            <input type="text" name="name" class="form-control" value="<?php echo $name; ?>">
                            <span class="help-block"><?php echo $name_err; ?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($password_err)) ? 'has-error' : ''; ?>">
                            <label>Password</label>
                            <input type="password" name="password" class="form-control" value="<?php echo $password; ?>">
                            <span class="help-block"><?php echo $password_err; ?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($confirm_password_err)) ? 'has-error' : ''; ?>">
                            <label>Confirm Password</label>
                            <input type="password" name="confirm_password" class="form-control" value="<?php echo $confirm_password; ?>">
                            <span class="help-block"><?php echo $confirm_password_err; ?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($user_type_err)) ? 'has-error' : ''; ?>">
                            <label>User Type</label>
                            <br>
                            <select id="user_type" name="user_type" class="form-control">
                                <option value="GO">Government Official</option>
                                <option value="FR">Firm Representative</ption>
                                <option value="PS">Public Servant</option>
                            </select>
                            <span class="help-block"><?php echo $user_type_err; ?></span>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-primary" value="Submit" name="submitbtn">
                            <input type="reset" class="btn btn-default" value="Reset">
                        </div>
                    </form>
                </div>
            </div>
        </li>
    </ul>
</div>
<?php include('footer.php') ?>
</body>

</html>