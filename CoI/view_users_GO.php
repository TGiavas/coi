<?php include('header.php');
include('connect.php');
include('redirect_GO.php');
include('navbar_GO.php')
?>


<div id="Public Servants">
    <div class="wrapper-table">
        <div class="page-header clearfix">
            <h2 class="pull-left">Public Servants</h2>
        </div>
        <?php
        // Attempt select query execution
        $sql = "SELECT * FROM users";
        if ($result = mysqli_query($conn, $sql)) {
            if (mysqli_num_rows($result) > 0) {
                echo  "<table id='users' class='table table-striped table-sm project-table' cellspacing='0' width='100%'>";
                echo "<thead>";
                echo "<tr>";
                echo "<th class='th-sm' id ='th-first' >User ΑΦΜ</th>";
                echo "<th class='th-sm'>User Name</th>";
                echo "<th class='th-sm'>User Type</th>";
                /*echo "<th class='th-sm' id ='th-last' style='width: 5%'>Action</th>";*/
                echo "</tr>";
                echo "</thead>";
                echo "<tbody>";
                while ($row = mysqli_fetch_array($result)) {
                    echo "<tr>";
                    echo "<td>" . $row['AFM'] . "</td>";
                    echo "<td>" . $row['name'] . "</td>";
                    echo "<td>" . $row['user_type'] . "</td>";
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
        echo "<a href='register.php' class='submit-button'>Register New User</a>";
        mysqli_close($conn);
        ?>
        </table>
    </div>
</div>

</body>
<?php include('footer.php') ?>

<script>
    $(document).ready(function() {
        $('#users').DataTable();
    });
</script>
</html>