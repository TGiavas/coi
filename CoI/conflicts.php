<?php include('header.php');
include('connect.php');
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
include('navbar_GO.php')
?>



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