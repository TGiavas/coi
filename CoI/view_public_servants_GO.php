<?php include('header.php');
include('connect.php');
include('redirect_GO.php');
include('navbar_GO.php');
?>


<div id="Public Servants">
    <div class="wrapper-table">
        <div class="page-header clearfix">
            <h2 class="pull-left">Public Servant Assignments</h2>
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
                echo "<th class='th-sm'>Public Servant Role</th>";
                echo "<th class='th-sm'  id='th-last' style='width: 5%'>Action</th>";
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
                    echo "<td><a href='delete_public_servant.php?ps_AFM=$row[ps_AFM]&project_id=$row[project_id]"  .  "' title='Delete Record' data-toggle='tooltip'><span class='fas fa-trash'>  </span></a>";
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
        echo "<a href='add_public_servant_GO.php' class='submit-button'>Assign public servant to project</a>";
        mysqli_close($conn);
        ?>
        </table>
    </div>
</div>

</body>
<?php include('footer.php') ?>

<script>
    $(document).ready(function() {
        $('#ps_projects').DataTable();
    });
</script>
</html>