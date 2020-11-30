<?php include('header.php');
include('connect.php');
?>



<div class="wrapper-table">
    <div class="page-header clearfix">
        <h2 class="pull-left">Conflicts of Interest</h2>
    </div>
    <?php



    // Attempt select query execution
    $sql = "SELECT * FROM conflicts  INNER JOIN projects ON conflicts.project_id = projects.project_id INNER JOIN public_servants ON conflicts.ps_id = public_servants.ps_AFM" ;
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
                echo "<td>" . $row['ps_id'] . "</td>";
                echo "<td>" . $row['ps_name'] . "</td>";
                echo "<td>" . $row['coi_description'] . "</td>";
                echo "<td><class='pull-left'form action='approve.php' method='POST'><input type='hidden' name='accept' value='".$row["conflict_id"]."'/><input type='submit' name='submit' value='Approve'/>
                </form><class='pull-left' form action='decline.php' method='POST'><input type='hidden' name='decline' value='".$row["conflict_id"]."'/><input type='submit' name='submit' value='Reject'/></form></td>"; 
                echo "<td>" . $row['status'] . "</td>";                  
                //echo "<td>";
                // echo "<a href='update.php?id=" . $row['project_id'] . "' title='Update Record' data-toggle='tooltip'><span class='fa fa-pencil'>  </span></a>";
                // echo " ";
                // echo "<a href='delete.php?id=" . $row['project_id'] . "' title='Delete Record' data-toggle='tooltip'><span class='fa fa-trash'>  </span></a>";
                echo "</td>";
                echo "</tr>";
            }
            /*echo "</tbody>";
            echo "<thead>";
            echo "<tr>";
            echo "<th>Project ID</th>";
            echo "<th>Project Name</th>";
            echo "<th>Project Date</th>";
            echo "<th>Project Description</th>";
            echo "<th>Public Servants</th>";
            echo "<th>Action</th>";
            echo "</tr>";
            echo "</thead>";*/
            echo "</table>";
            // Free result set
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