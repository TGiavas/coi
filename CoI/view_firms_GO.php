<?php include('header.php');
include('connect.php');
include('redirect_GO.php');
include('navbar_GO.php')
?>


<div id="Firms">
    <div class="wrapper-table">
        <div class="page-header clearfix">
            <h2 class="pull-left">Firm representatives</h2>
        </div>
        <?php
        // Attempt select query execution
        $sql = "SELECT * FROM firms";
        if ($result = mysqli_query($conn, $sql)) {
            if (mysqli_num_rows($result) > 0) {
                echo  "<table id='firms' class='table table-striped table-sm project-table' cellspacing='0' width='100%'>";
                echo "<thead>";
                echo "<tr>";
                echo "<th class='th-sm' id ='th-first'>Firm Name</th>";
                /*echo "<th class='th-sm' id ='th-last' style='width: 5%'>Action</th>";*/
                echo "</tr>";
                echo "</thead>";
                echo "<tbody>";
                while ($row = mysqli_fetch_array($result)) {
                    echo "<tr>";
                    echo "<td>" . $row['firm_name'] . "</td>";
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
        echo "<a href='add_firm_GO.php' class='submit-button'>Add New Firm</a>";
        mysqli_close($conn);
        ?>
        </table>
    </div>
</div>

</body>
<?php include('footer.php') ?>

<script>
    $(document).ready(function() {
        $('#firms').DataTable();
    });
</script>
</html>