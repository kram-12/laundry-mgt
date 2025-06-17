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
    <title>Laundry - Laundry Automation</title>
    <link rel="stylesheet" href="style.css">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body>
    <div class="sidep">
        <div class="log">
            <img src="https://srmap.edu.in/file/2019/12/White.png" alt="SRMAP">
        </div>
        <ul>
            <li class="act"><a href="http://localhost/Laundry-Automation/Student/student.php">Profile</a></li>
            <li><a href="#">Laundry</a></li>
            <li><a href="logout.php">Logout</a></li>
        </ul>
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

    echo '<div class="mainp">
    <div class="nav">
        Laundry Details
    </div>
    <div class="detailsl">
        <div class="ret">
            <div class="left">
                Number of Washes Left : '. $row['washes'] .'
                <br>
                Last Updated : '. $row['last_updated'] .'
            </div>

            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Registration Number</th>
                        <th>Phone Number</th>
                        <th>Email</th>
                        <th>Status</th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>'.$row['Name'].'</td>
                        <td>'.$row['Regd'].'</td>
                        <td>'.$row['contact'].'</td>
                        <td>'.$row['email'].'</td>
                        <td class="stat">'.$row['status'].'</td>

                    </tr>
                </tbody>
            </table>
            </div>
            </div>
        </div>
        ';

    ?>

    <script>
        var element = document.querySelector('.stat');
        var textContent = element.textContent || element.innerText;

        if (textContent.includes('Pending')){
            element.style.backgroundColor = 'yellow';
        }else{
            element.style.backgroundColor = 'green';
        }
    </script>
</body>

</html>