
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


<div id="View Applied Projects" class="tabcontent">
  <div class="wrapper-table">
    <div class="page-header clearfix">
      <h2 class="pull-left">Applied Projects</h2>
    </div>
    <?php

    $sql = "SELECT * FROM firms_projects INNER JOIN projects ON firms_projects.project_id = projects.project_id WHERE firm_id = 1 ";
    if ($result = mysqli_query($conn, $sql)) {
      if (mysqli_num_rows($result) > 0) {
        echo  "<table id='firm_projects' class='table table-striped table-sm project-table' cellspacing='0' width='100%'>";
        echo "<thead>";
        echo "<tr>";
        echo "<th class='th-sm' id ='th-first' >Project ID</th>";
        echo "<th class='th-sm'>Project Name</th>";
        echo "<th class='th-sm'>Project Start Date Date</th>";
        echo "<th class='th-sm'>Project End Date Date Date</th>";
        echo "<th class='th-sm' id='th-last'>Project Description</th>";
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
          echo "<a href='update.php?id=" . $row['project_id'] . "' title='Update Record' data-toggle='tooltip'><span class='fa fa-pencil'>  </span></a>";
          echo " ";
          echo "<a href='delete.php?id=" . $row['project_id'] . "' title='Delete Record' data-toggle='tooltip'><span class='fa fa-trash'>  </span></a>";
          echo "</td>";
          echo "</tr>";
        }
        echo "</table>";

        // Free result set
        mysqli_free_result($result);
      } else {
        echo "<p class='lead'><em>No records were found.</em></p>";
      }
    } else {
      echo "ERROR: Could not execute $sql. " . mysqli_error($conn);
    }
    ?>
  </div>
</div>

<?php include('footer.php') ?>
<script>
    $(document).ready(function() {
        $('#firm_projects').DataTable();
        $('.dataTables_length').addClass('bs-select');
    });
</script>

</body>

</html>
