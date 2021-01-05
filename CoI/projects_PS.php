<?php 
include('header.php');
include('connect.php');
include('redirect_PS.php');
include('navbar_PS.php');
?>


<div id="View All Projects" class="tabcontent" id="defaultOpen">
    <div class="wrapper-table">
        <div class="page-header clearfix">
            <h2 class="pull-left">Projects</h2>
        </div>
        <?php
        // Attempt select query execution
        $AFM = $_SESSION['AFM'];
        $sql = "SELECT projects.project_id, projects.project_name, projects.project_start_date, projects.project_end_date, projects.project_desc, conflicts.coi_description
        FROM public_servants LEFT JOIN projects ON public_servants.project_id = projects.project_id LEFT JOIN conflicts ON projects.project_id = conflicts.project_id AND conflicts.ps_AFM = $AFM WHERE public_servants.ps_AFM = $AFM";
        if ($result = mysqli_query($conn, $sql)) {
            if (mysqli_num_rows($result) > 0) {
                echo  "<table id='ps_projects' class='table table-striped table-sm project-table' cellspacing='0' width='100%'>";
                echo "<thead>";
                echo "<tr>";
                echo "<th class='th-sm' id ='th-first' >Project ID</th>";
                echo "<th class='th-sm'>Project Name</th>";
                echo "<th class='th-sm'>Project Start Date </th>";
                echo "<th class='th-sm'>Project End Date </th>";
                echo "<th class='th-sm'>Project Description</th>";
                echo "<th class='th-sm' id='th-last'>Conflict Description</th>";

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
                    echo "<td>" . $row['coi_description'] . "</td>";
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