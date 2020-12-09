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
        Public Servant:
        <?php echo $_SESSION["AFM"]; ?>
    </span>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="projects_PS.php">Projects</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="disclose_coi.php">Disclose Conflict of Interest</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" method="post" action="logout.php" id="logoutform">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="logout-btn">Log Out</button>
        </form>
    </div>
</nav>

<div id="View All Projects" class="tabcontent" id="defaultOpen">
    <div class="wrapper-table">
        <div class="page-header clearfix">
            <h2 class="pull-left">Projects</h2>
        </div>
        <?php
        // Attempt select query execution
        $AFM = $_SESSION['AFM'];
        $sql = "SELECT * FROM public_servants INNER JOIN projects ON projects.project_id = public_servants.project_id WHERE ps_AFM = $AFM ";
        if ($result = mysqli_query($conn, $sql)) {
            if (mysqli_num_rows($result) > 0) {
                echo  "<table id='ps_projects' class='table table-striped table-sm project-table' cellspacing='0' width='100%'>";
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
        echo "<a href='disclose_coi.php' class='submit-button'>Disclose Conflict of Interest</a>";
        mysqli_close($conn);
        ?>
        </table>
    </div>
</div>


<?php include('footer.php') ?>
<script>
    $(document).ready(function() {
        $('#ps_projects').DataTable();
        $('.dataTables_length').addClass('bs-select');
    });
</script>


</body>

</html>