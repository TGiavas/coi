<?php
//Initialize the session
if (session_status() == PHP_SESSION_NONE) {
  session_start();
}

// Check if the user is already logged in, if yes then redirect him to welcome page
if (isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true) {

  if ($_SESSION["user_type"] == "GO") { //check usertype
    header("Location:projects_GO.php"); //if normal user redirect to app.php
    exit;
  } else if ($_SESSION["user_type"] == "FR") {
    header("projects_FR.php"); //if admin user redirect to admin.php
    exit;
  } else {
    header("projects_PS.php"); //if admin user redirect to admin.php
    exit;
  }
}






// Include config file
require_once "config.php";

// Define variables and initialize with empty values
$AFM = $password = "";
$AFM_err = $password_err = "";

// Processing form data when form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {

  // Check if AFM is empty
  if (empty(trim($_POST["AFM"]))) {
    $AFM_err = "Please enter AFM.";
  } else {
    $AFM = trim($_POST["AFM"]);
  }

  // Check if password is empty
  if (empty(trim($_POST["password"]))) {
    $password_err = "Please enter your password.";
  } else {
    $password = trim($_POST["password"]);
  }

  // Validate credentials
  if (empty($AFM_err) && empty($password_err)) {
    // Prepare a select statement
    $sql = "SELECT AFM, name, password, user_type FROM users WHERE AFM = ?";

    if ($stmt = mysqli_prepare($link, $sql)) {
      // Bind variables to the prepared statement as parameters
      mysqli_stmt_bind_param($stmt, "s", $param_AFM);

      // Set parameters
      $param_AFM = $AFM;

      // Attempt to execute the prepared statement
      if (mysqli_stmt_execute($stmt)) {
        // Store result
        mysqli_stmt_store_result($stmt);

        // Check if AFM exists, if yes then verify password
        if (mysqli_stmt_num_rows($stmt) == 1) {
          // Bind result variables
          mysqli_stmt_bind_result($stmt, $AFM, $name, $hashed_password, $user_type);
          if (mysqli_stmt_fetch($stmt)) {
            if (password_verify($password, $hashed_password)) {
              // Password is correct, so start a new session

              if (session_status() == PHP_SESSION_NONE) {
                session_start();
              }


              // Store data in session variables
              $_SESSION["loggedin"] = true;
              $_SESSION["AFM"] = $AFM;
              $_SESSION["name"] = $name;
              $_SESSION["user_type"] = $user_type;

              // Redirect user to welcome page
              if ($_SESSION["user_type"] == "GO") { //check usertype
                header("Location:projects_GO.php");
              } else if ($_SESSION["user_type"] == "FR") {
                header("Location:projects_FR.php"); 
              } else {
                header("Location:projects_PS.php"); 
              }
            } else {
              // Display an error message if password is not valid
              $password_err = "The password you entered was not valid.";
            }
          }
        } else {
          // Display an error message if AFM doesn't exist
          $AFM_err = "No account found with that AFM.";
        }
      } else {
        echo "Oops! Something went wrong. Please try again later.";
      }

      // Close statement
      mysqli_stmt_close($stmt);
    }
  }

  // Close connection
  mysqli_close($link);
}
?>


</html>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="css/loginstyle.css">
</head>

<body>
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
            <p style="font-size:30px; padding-bottom: 80px;"> Log in to Government Projects</h1>
          </div>
          <!-- PHP Form -->
          <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <input type="text" name="AFM" placeholder="ΑΦΜ" class="text-input">
            <br>
            <input type="password" name="password" placeholder="Password" class="text-input">
            <br>
            <input type="submit" class="login-btn" value="Login">
          </form>
        </div>
      </div>
    </li>
  </ul>
</body>

</html>