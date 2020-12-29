<?php
error_reporting(0);
include('header.php');
include('connect.php');
include('redirect_FR.php');
include('navbar_FR.php');
include('log.php');

$project_id = $_POST['idInput'];
$fr_AFM = $_SESSION["AFM"];
$sql = "SELECT * FROM users INNER JOIN firm_representatives ON users.AFM = firm_representatives.fr_AFM where fr_AFM = $fr_AFM";
$result = $conn->query($sql);
$firm_id = "";
while ($rows = $result->fetch_assoc()) {
  $firm_id = $rows['firm_id'];
}
echo "$firm_id";

$sql = "INSERT INTO firms_projects(firm_id, project_id) VALUES ($firm_id, '$project_id')";
$sqlDupe = "SELECT * FROM firms_projects WHERE project_id = '$project_id' AND firm_id = 'test'";
$sqlExists = "SELECT * FROM projects WHERE project_id = '$project_id'";



if ($_SERVER["REQUEST_METHOD"] == "POST") {

  //Checks if application is a duplicate
  if ($stmt = mysqli_prepare($conn, $sqlDupe)) {
    if (mysqli_stmt_execute($stmt)) {
      mysqli_stmt_store_result($stmt);
      if (mysqli_stmt_num_rows($stmt) > 0) {
        echo "Already applied for this project";
      } else {
        mysqli_stmt_close($stmt);
        //Checks if the project exists
        if ($stmt = mysqli_prepare($conn, $sqlExists)) {
          if (mysqli_stmt_execute($stmt)) {
            mysqli_stmt_store_result($stmt);
            if (mysqli_stmt_num_rows($stmt) > 0) {
              //Adds application to the firm_project table.
              if ($conn->query($sql) === TRUE) {
                $message = "Applied for project " . $project_id;
                logAction($message, $conn);
              } else {
                echo "Error: " . $sql . "<br>" . $conn->error;
              }
            } else {
              echo "Project doesn't exist";
            }
          }
        } else {
          echo "Oops! Something went wrong. Please try again later.";
        }
        mysqli_stmt_close($stmt);
      }
    }
  }
}

?>




<!-- Tab content -->
<div id="View All Projects" class="tabcontent" id="defaultOpen">

  <script>
  /*
    if (window.history.replaceState) {
      window.history.replaceState(null, null, window.location.href);
    }


    function doesntExist() {
      alert("Project doesn't exist.");
    }

    function alreadyApplied() {
      alert("You have already applied for this project");
    }
    */
  </script>

  <div class="wrapper-table">
    <div class="page-header clearfix">
      <h2 class="pull-left">Projects</h2>
    </div>
    <?php


    // Attempt select query execution
    $sql = "SELECT projects.project_id, projects.project_name, projects.project_start_date, projects.project_end_date, projects.project_desc, firms_projects.date_applied FROM projects LEFT JOIN firms_projects ON projects.project_id = firms_projects.project_id";
    if ($result = mysqli_query($conn, $sql)) {
      if (mysqli_num_rows($result) > 0) {
        echo  "<table id='projects' class='table table-striped table-sm project-table' cellspacing='0' width='100%'>";
        echo "<thead>";
        echo "<tr>";
        echo "<th class='th-sm' id ='th-first' >Project ID</th>";
        echo "<th class='th-sm'>Project Name</th>";
        echo "<th class='th-sm'>Project Start Date Date</th>";
        echo "<th class='th-sm'>Project End Date Date Date</th>";
        echo "<th class='th-sm'>Project Description</th>";
        echo "<th class='th-sm' id='th-last'>Date Applied</th>";
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
          echo "<td>" . $row['date_applied'] . "</td>";

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

    // Applied project list.
    echo "<center>";
    echo "<form method='post'>";
    echo "<h5 style='color:white'>Enter the Project ID you want to apply for</h5>";
    echo "<br>";
    echo "<input type='text' placeholder='e.g. #3828' name='idInput' class='idInput' required>";
    echo "</center>";
    echo "<input type='submit' value='Apply' name='apply' class='submit-button'>";
    echo "</form>";

    //Table of projects the firm has applied for
    ?>

  </div>
</div>









<?php include('footer.php') ?>
<script>
    $(document).ready(function() {
        $('#projects').DataTable();
        $('#firm_projects').DataTable();
        $('#stakeholders').DataTable();
        $('.dataTables_length').addClass('bs-select');
    });
</script>

</body>

</html>
