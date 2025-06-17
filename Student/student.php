
<?php 

session_start();
    if (!isset($_SESSION['regd'])) {
        header("Location: http://localhost/Laundry-Automation/Auth/login.php");
        exit();
    }
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard - Laundry Automation</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="sidep">
        <div class="log">
            <img src="https://srmap.edu.in/file/2019/12/White.png" alt="SRMAP LOGO">
        </div>
        <ul>
            <li class="act"><a href="#">Profile</a></li>
            <li><a href="http://localhost/Laundry-Automation/Student/laundry.php">Laundry</a></li>
            <li><a href="logout.php">Logout</a></li>
        </ul>
    </div>
    <div class="mainp">
        <div class="nav">
            Personal Details
        </div>

        <?php

        $servername = "localhost:3307";
        $username = "root";
        $password = "";
        $database = "laundry";


        $conn = mysqli_connect($servername, $username, $password, $database);

        $regd = $_SESSION['regd'];

        $add = " where Regd='" . $regd . "';";
        $sql = "SELECT * FROM `info`" . $add;
        $result = mysqli_query($conn, $sql);

        $row = mysqli_fetch_assoc($result);

        echo '<div class="det1">

            <div class="details">
                <h2 class="name">
                    ' . $row['Name'] . '
                </h2>
                <div class="divs">

                    <div class="div1">
                        <div class="roll">
                            Reg No:' . $row['Regd'] . '
                        </div>
                        <div class="email">
                            Email: ' . $row['email'] . '
                        </div>
                        <div class="phone">
                            Phone: ' . $row['contact'] . '
                        </div>
                        <div class="sec">
                            Section: ' . $row['section'] . '
                        </div>
                    </div>
                    <div class="div2">
                        <div class="gender">
                            Gender: ' . $row['gender'] . '
                        </div>
                        <div class="hostel">
                            Hostel: ' . $row['hostel'] . '
                        </div>
                        <div class="room">
                            Room No: ' . $row['roomno'] . '
                        </div>
                        <div class="bt">
                            Batch: ' . $row['batch'] . '
                        </div>
                    </div>
                </div>
                
                <div class="qrm">

                    <div class="qr">
                        
                    </div>
                </div>
            </div>
        </div>';


        ?>

    </div>
</body>

</html>