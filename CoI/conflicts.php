<?php include('header.php');
include('connect.php');
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
?>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Conflicts of Interest</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <span class="navbar-text">
        Government Official:
        <?php echo $_SESSION["AFM"]; ?>
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
            <li class="nav-item">
                <a class="nav-link" href="register.php">Register User</a>
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

<div id="Conflicts">
    <div class="wrapper-table">
        <div class="page-header clearfix">
            <h2 class="pull-left">Conflicts of Interest</h2>
        </div>
        <?php
        // Attempt select query execution
        $sql = "SELECT * FROM conflicts INNER JOIN projects ON conflicts.project_id = projects.project_id INNER JOIN users ON conflicts.ps_AFM = users.AFM";
        if ($result = mysqli_query($conn, $sql)) {
            if (mysqli_num_rows($result) > 0) {
                echo  "<table id='conflicts' class='table table-striped table-sm project-table' cellspacing='0' width='100%'>";
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
                    <input type='hidden' name='conflict_id' value='" . $row["conflict_id"] . "'/>
                    <input type='submit' name='submit' value='Approve'/>
                    </form>
                    <form method='POST' class='coi-btn-form' action='reject_coi.php'>
                    <input type='hidden' name='conflict_id' value='" . $row["conflict_id"] . "'/>
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




<?php include('footer.php') ?>
<script>
    $(document).ready(function() {
        $('#conflicts').DataTable();
        $('.dataTables_length').addClass('bs-select');
    });
</script>


</body>

</html>