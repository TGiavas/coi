
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Conflicts of Interest</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <span class="navbar-text">
        Public Servant:
        <?php echo $_SESSION["name"]; ?>
    </span>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="projects_PS.php">Projects</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="disclose_coi.php">Disclose Conflict of Interest</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" method="post" action="logout.php" id="logoutform">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="logout-btn">Log Out</button>
        </form>
    </div>
</nav>