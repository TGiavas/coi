
<?php
include('header.php');
include('connect.php');
include('redirect_FR.php');
include('navbar_FR.php');

?>



<div id="View Firm Stakeholders" class="tabcontent">
  <div class="wrapper-table">
    <div class="page-header clearfix">
      <h2 class="pull-left">Firm Stakeholders</h2>
    </div>
    <?php 
$fr_AFM = $_SESSION["AFM"];
$sql = "SELECT * FROM users INNER JOIN firm_representatives ON users.AFM = firm_representatives.fr_AFM where fr_AFM = $fr_AFM";
$result = $conn->query($sql);
$firm_id = "";
while ($rows = $result->fetch_assoc()) {
  $firm_id = $rows['firm_id'];
}
    
    $sql = "SELECT * FROM firm_stakeholders INNER JOIN projects on firm_stakeholders.project_id = projects.project_id WHERE firm_id=$firm_id";
    if ($result = mysqli_query($conn, $sql)) {
      if (mysqli_num_rows($result) > 0) {
        echo  "<table id='stakeholders' class='table table-striped table-sm project-table' cellspacing='0' width='100%'>";
        echo "<thead>";
        echo "<tr>";
        echo "<th class='th-sm' id ='th-first' >ΑΦΜ</th>";
        echo "<th class='th-sm'>Name</th>";
        echo "<th class='th-sm'>Role</th>";
        echo "<th class='th-sm' id=>Project Name</th>";
        echo "<th class='th-sm' id='th-last'>Action</th>";
        echo "</tr>";
        echo "</thead>";
        echo "<tbody>";
        while ($row = mysqli_fetch_array($result)) {
          echo "<tr>";
          echo "<td>" . $row['stakeholder_AFM'] . "</td>";
          echo "<td>" . $row['stakeholder_name'] . "</td>";
          echo "<td>" . $row['stakeholder_role'] . "</td>";
          echo "<td>" . $row['project_name'] . "</td>";
          echo "<td><a href='delete_firm_stakeholder.php?stakeholder_AFM=$row[stakeholder_AFM]&project_id=$row[project_id]"  .  "' title='Delete Record' data-toggle='tooltip'><span class='fas fa-trash'>  </span></a>";
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

    echo "<a href='add_stakeholder.php' class='submit-button'>Add New Stakeholder</a>";
    // Close connection
    mysqli_close($conn);
    ?>
    </table>
  </div>
</div>

<?php include('footer.php') ?>
<script>
    $(document).ready(function() {
        $('#stakeholders').DataTable();
        $('.dataTables_length').addClass('bs-select');
    });
</script>

</body>

</html>
