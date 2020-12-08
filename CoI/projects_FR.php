<?php
error_reporting(0);
include('header.php');
include('connect.php');

$project_id = $_POST['idInput'];

$sql = "INSERT INTO firms_projects(firm_id, project_id) VALUES (1, '$project_id')";
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
                //echo "Applied successfully";
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


<!-- Tab links -->
<div class="tab">
  <button class="tablinks" id="defaultOpen" onclick="openTab(event, 'View All Projects')">View All Projects</button>
  <button class="tablinks" onclick="openTab(event, 'View Applied Projects')">View Applied Projects</button>
  <button class="tablinks" onclick="openTab(event, 'View Firm Stakeholders')">View Firm Stakeholders</button>
  <form method="post" action="logout.php" id="logoutform">
    <button class="tablinks" id="logout-btn">Log Out</button>
  </form>
</div>

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
        $('#projects').DataTable();
        $('#firm_projects').DataTable();
        $('#stakeholders').DataTable();
        $('.dataTables_length').addClass('bs-select');
    });
</script>

</body>

</html>
