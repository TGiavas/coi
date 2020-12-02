<?php include('header.php');
include('connect.php');
?>

<div class="tab">
    <button class="tablinks" id="defaultOpen" onclick="openTab(event, 'View All Projects')">Projects</button>
    <button class="tablinks" onclick="openTab(event, 'Public Servants')">Public Servants</button>
    <button class="tablinks" onclick="openTab(event, 'Conflicts')">Conflicts of Interest</button>
    <button class="tablinks" onclick="openTab(event, 'Register User')">Register User</button>
    <form method="post" action="logout.php" id="logoutform">
      <button class="tablinks" id="logout-btn">Log Out</button>
    </form>
</div>



<div id="View All Projects" class="tabcontent" id="defaultOpen">
    <div class="wrapper-table">
        <div class="page-header clearfix">
            <h2 class="pull-left">Projects</h2>
        </div>
        <?php
        // Attempt select query execution
        $sql = "SELECT * FROM projects";
        if ($result = mysqli_query($conn, $sql)) {
            if (mysqli_num_rows($result) > 0) {
                echo  "<table id='projects' class='table table-striped table-sm project-table' cellspacing='0' width='100%'>";
                echo "<thead>";
                echo "<tr>";
                echo "<th class='th-sm' id ='th-first' >Project ID</th>";
                echo "<th class='th-sm'>Project Name</th>";
                echo "<th class='th-sm'>Project Start Date Date</th>";
                echo "<th class='th-sm'>Project End Date Date Date</th>";
                echo "<th class='th-sm' id='th-last'>Project Description</th>";
                /*echo "<th class='th-sm' id ='th-last' style='width: 5%'>Action</th>";*/
                echo "</tr>";
                echo "</thead>";
                echo "<tbody>";
                while ($row = mysqli_fetch_array($result)) {
                    echo "<tr>";
                    echo "<td>" . $row['project_id'] . "</td>";
                    echo "<td>" . $row['project_name'] . "</td>";
                    echo "<td>" . $row['project_start_date'] . "</td>";
                    echo "<td>" . $row['project_end_date'] . "</td>";
                    echo "<td>" . $row['project_desc'] . "</td>";
                    echo "</td>";
                    echo "</tr>";
                }
                echo "</table>";
                mysqli_free_result($result);
            } else {
                echo "<p class='lead'><em>No records were found.</em></p>";
            }
        } else {
            echo "ERROR: Could not able to execute $sql. " . mysqli_error($conn);
        }
        echo "<a href='create_project.php' class='submit-button'>Add New Project</a>";
//        mysqli_close($conn);
        ?>
        </table>
    </div>
</div>

<div id="Public Servants" class="tabcontent">
    <div class="wrapper-table">
        <div class="page-header clearfix">
            <h2 class="pull-left">Public Servants</h2>
        </div>
        <?php
        // Attempt select query execution
        $sql = "SELECT * FROM public_servants INNER JOIN users ON users.AFM = public_servants.ps_AFM INNER JOIN projects ON projects.project_id = public_servants.project_id";
        if ($result = mysqli_query($conn, $sql)) {
            if (mysqli_num_rows($result) > 0) {
                echo  "<table id='ps_projects' class='table table-striped table-sm project-table' cellspacing='0' width='100%'>";
                echo "<thead>";
                echo "<tr>";
                echo "<th class='th-sm' id ='th-first' >Public Servant ΑΦΜ</th>";
                echo "<th class='th-sm'>Public Servant Name</th>";
                echo "<th class='th-sm'>Project Name</th>";
                echo "<th class='th-sm' id='th-last'>Public Servant Role</th>";
                /*echo "<th class='th-sm' id ='th-last' style='width: 5%'>Action</th>";*/
                echo "</tr>";
                echo "</thead>";
                echo "<tbody>";
                while ($row = mysqli_fetch_array($result)) {
                    echo "<tr>";
                    echo "<td>" . $row['ps_AFM'] . "</td>";
                    echo "<td>" . $row['name'] . "</td>";
                    echo "<td>" . $row['project_name'] . "</td>";
                    echo "<td>" . $row['ps_role'] . "</td>";
                    echo "</td>";
                    echo "</tr>";
                }
                echo "</table>";
                mysqli_free_result($result);
            } else {
                echo "<p class='lead'><em>No records were found.</em></p>";
            }
        } else {
            echo "ERROR: Could not able to execute $sql. " . mysqli_error($conn);
        }
        echo "<a href='create_project.php' class='submit-button'>Add New Project</a>";
//        mysqli_close($conn);
        ?>
        </table>
    </div>
</div>

<div id="Conflicts" class="tabcontent">
    <div class="wrapper-table">
        <div class="page-header clearfix">
            <h2 class="pull-left">Conflicts of Interest</h2>
        </div>
        <?php
        // Attempt select query execution
        $sql = "SELECT * FROM conflicts INNER JOIN projects ON conflicts.project_id = projects.project_id INNER JOIN users ON conflicts.ps_AFM = users.AFM";
        if ($result = mysqli_query($conn, $sql)) {
            if (mysqli_num_rows($result) > 0) {
                echo  "<table id='projects' class='table table-striped table-sm project-table' cellspacing='0' width='100%'>";
                echo "<thead>";
                echo "<tr>";
                echo "<th class='th-sm' id ='th-first' >Project ID</th>";
                echo "<th class='th-sm'>Project Name</th>";
                echo "<th class='th-sm'>Public Servant ID</th>";
                echo "<th class='th-sm'>Public Servant Name</th>";
                echo "<th class='th-sm'>Conflict Description</th>";
                echo "<th class='th-sm'>Action</th>";
                echo "<th class='th-sm' id='th-last'>Status</th>";
                /*echo "<th class='th-sm' id ='th-last' style='width: 5%'>Action</th>";*/
                echo "</tr>";
                echo "</thead>";
                echo "<tbody>";
                while ($row = mysqli_fetch_array($result)) {
                    echo "<tr>";
                    echo "<td>" . $row['project_id'] . "</td>";
                    echo "<td>" . $row['project_name'] . "</td>";
                    echo "<td>" . $row['ps_AFM'] . "</td>";
                    echo "<td>" . $row['name'] . "</td>";
                    echo "<td>" . $row['coi_description'] . "</td>";
                    echo "<td><form method='POST'class='coi-btn-form' action='approve_coi.php'>
                    <input type='hidden' name='conflict_id' value='".$row["conflict_id"]."'/>
                    <input type='submit' name='submit' value='Approve'/>
                    </form>
                    <form method='POST' class='coi-btn-form' action='reject_coi.php'>
                    <input type='hidden' name='conflict_id' value='".$row["conflict_id"]."'/>
                    <input type='submit' name='submit' value='Reject'/>
                    </form>
                    </td>";
                    echo "<td>" . $row['status'] . "</td>";
                    echo "</td>";
                    echo "</tr>";
                }
                echo "</table>";
                mysqli_free_result($result);
            } else {
                echo "<p class='lead'><em>No records were found.</em></p>";
            }
        } else {
            echo "ERROR: Could not able to execute $sql. " . mysqli_error($conn);
        }
        // Close connection
        mysqli_close($conn);
        ?>
    </div>

    </table>
</div>



<div id="Register User" class="tabcontent">
    <?php
    // Include config file
    require_once "config.php";
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
        mysqli_close($link);
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
</div>

</body>

















<script>
    function openTab(evt, tabName) {
        // Declare all variables
        var i, tabcontent, tablinks;

        // Get all elements with class="tabcontent" and hide them
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }

        // Get all elements with class="tablinks" and remove the class "active"
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }

        // Show the current tab, and add an "active" class to the button that opened the tab
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.className += " active";
    }
</script>



<script>
    // Get the element with id="defaultOpen" and click on it
    document.getElementById("defaultOpen").click();
</script>
<?php include('footer.php') ?>
<script>
    $(document).ready(function() {
        $('#conflicts').DataTable();
        $('#projects').DataTable();
        $('#ps_projects').DataTable();
        $('.dataTables_length').addClass('bs-select');
    });
</script>


</body>
