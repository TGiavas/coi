<?php include('header.php');
include('connect.php');
include('redirect_GO.php');
include('navbar_GO.php')
?>


<div id="Public Servants">
    <div class="wrapper-table">
        <div class="page-header clearfix">
            <h2 class="pull-left">Firm representatives</h2>
        </div>
        <?php
        // Attempt select query execution
        //$sql = "SELECT * FROM firm_representatives INNER JOIN users ON users.AFM = firm_representatives.fr_AFM INNER JOIN firms ON firm_representatives.firm_id = firms.firm_id";
        $sql = "SELECT users.AFM, users.name, firms.firm_name FROM users LEFT JOIN firm_representatives ON users.AFM = firm_representatives.fr_AFM LEFT JOIN firms ON firm_representatives.firm_id = firms.firm_id WHERE users.user_type='FR'";
        if ($result = mysqli_query($conn, $sql)) {
            if (mysqli_num_rows($result) > 0) {
                echo  "<table id='firm_representatives' class='table table-striped table-sm project-table' cellspacing='0' width='100%'>";
                echo "<thead>";
                echo "<tr>";
                echo "<th class='th-sm' id='th-first'>Firm Representative ΑΦΜ</th>";
                echo "<th class='th-sm'>Firm Representative Name</th>";
                echo "<th class='th-sm id='th-last>Firm Name</th>";
                echo "<th class='th-sm' id ='th-last' style='width: 5%'>Action</th>";
                echo "</tr>";
                echo "</thead>";
                echo "<tbody>";
                while ($row = mysqli_fetch_array($result)) {
                    echo "<tr>";
                    echo "<td>" . $row['AFM'] . "</td>";
                    echo "<td>" . $row['name'] . "</td>";
                    echo "<td>" . $row['firm_name'] . "</td>";
                    echo "<td><a href='delete_firm_representatives.php?fr_AFM=" . $row['AFM'] . "' title='Delete Record' data-toggle='tooltip'><i class='fas fa-trash'></i></td> ";
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
        echo "<a href='add_firm_representative_GO.php' class='submit-button'>Add Firm Representative</a>";
        mysqli_close($conn);
        ?>
        </table>
    </div>
</div>

</body>
<?php include('footer.php') ?>

<script>
    $(document).ready(function() {
        $('#firm_representatives').DataTable();
    });
</script>
</html>