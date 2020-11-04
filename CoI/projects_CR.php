<?php include('header.php');
include('connect.php');
?>

<html>

<body>
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
            /*
            echo "</tbody>";
            echo "<thead>";
            echo "<tr>";
            echo "<th>Project ID</th>";
            echo "<th>Project Name</th>";
            echo "<th>Project Date</th>";
            echo "<th>Project Description</th>";
            echo "<th>Public Servants</th>";
            echo "</tr>";
            echo "</thead>";
            echo "</table>";
            */
            echo "</table>";

            // Free result set
            mysqli_free_result($result);
        } else {
            echo "<p class='lead'><em>No records were found.</em></p>";
        }
    } else {
        echo "ERROR: Could not able to execute $sql. " . mysqli_error($conn);
    }

    // Apply for project form
    echo "<form method='post'>";
    echo "<center>";
    echo "<h5 style='color:white'>Enter the Project ID you want to apply for</h5>";
    echo "<br>";
    echo "<input type='text' placeholder='e.g. #3828' name='apply' class='idinput'>";
    echo "</center>";
    echo "<input type='submit' value='Apply' name='apply' class='submit-button'>" ;
    echo "</form>";

    // Close connection
    mysqli_close($conn);
    ?>

    </table>
</div>


<?php include('footer.php') ?>
<script>
    $(document).ready(function() {
        $('#projects').DataTable();
        $('.dataTables_length').addClass('bs-select');
    });
</script>

</body>

</html>
