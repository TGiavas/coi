<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmation email</title>
    <link rel="stylesheet" href="css/redirect.css" type="text/css">
</head>
<body>
    
</body>
</html>
<!-- Redirection Counter -->
<!-- Redirection Counter -->
<script type="text/javascript">
  var count = 10; // Timer
  var redirect = "view_public_servants_GO.php"; // Target URL

  function countDown() {
    var timer = document.getElementById("timer"); // Timer ID
    if (count > 0) {
      count--;
      timer.innerHTML = "This page will redirect in " + count + " seconds."; // Timer Message
      setTimeout("countDown()", 1000);
    } else {
      window.location.href = redirect;
    }
  }
</script>

<div id="master-wrap">
  <div id="logo-box">

    <div class="animated fast fadeInUp">
      <div class="icon"></div>
      <h1>Thank you</h1>
    </div>

    <div class="notice animated fadeInUp">
      <p class="lead">An email has been sent to the public servant notifying him of the assignment!</p>
      <a class="btn animation" href="view_public_servants_GO.php">&larr; Back</a>
    </div>

    <div class="footer animated slow fadeInUp">
      <p id="timer">
        <script type="text/javascript">
          countDown();
        </script>
      </p>
    </div>

  </div>
  <!-- /#logo-box -->
</div>
<!-- /#master-wrap -->