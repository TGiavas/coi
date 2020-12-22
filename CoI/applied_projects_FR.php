<?php
include('header.php');
include('connect.php');
include('redirect_FR.php');
include('navbar_FR.php');

?>



<div id="View Applied Projects" class="tabcontent">
  <div class="wrapper-table">
    <div class="page-header clearfix">
      <h2 class="pull-left">Applied Projects</h2>
    </div>
    <?php

    
    $fr_AFM = $_SESSION["AFM"];
    $sql = "SELECT * FROM firm_representatives WHERE fr_AFM = $fr_AFM";
    $result = $conn->query($sql);
    $firm_id = "";
    while ($rows = $result->fetch_assoc()) {
      $firm_id = $rows['firm_id'];
    }
    $sql = "SELECT * FROM firms_projects INNER JOIN projects ON firms_projects.project_id = projects.project_id WHERE firm_id = $firm_id ";
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