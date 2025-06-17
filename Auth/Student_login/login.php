<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login - Laundry Automation</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <div class="container__content">
            <div class="container__ele">
                <h1>Student Log In</h1>
            </div>
            <h6><i class="ri-information-2-fill"></i> Students must use their college RegisterID</h6>
            <form action="login.php" method="post">
                <label for="regd">Regd No</label>
                <div class="input__row">
                    <input type="text" id="regd" name="regd" placeholder="Enter Your RegisterID" required />
                </div>
                <div class="input__header">
                    <label for="password">Password</label>
                    <a href="#">Forgot Password?</a>
                </div>
                <div class="input__row">
                    <input type="password" id="password" name="password" placeholder="Password" required />
                    <span id="password-eye"><i class="ri-eye-off-line"></i></span>
                </div>
                <button type="submit">LOGIN</button>
            </form>
        </div>
        <div class="container__image"></div>
    </div>
</body>
</html>


<?php
    if(isset($_POST['regd']) && isset($_POST['password'])){
    session_start();

    $servername = "localhost:3307";
    $username = "root";
    $password = "";
    $database = "laundry";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $database);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $regd = $_POST['regd'];
    $submittedPassword = $_POST['password'];

    $sql = "SELECT hashed_pass FROM info WHERE Regd = ?";
    $stmt = $conn->prepare($sql);

    if (!$stmt) {
        die("Error preparing statement: " . $conn->error);
    }


    $stmt->bind_param('s', $regd);
    $stmt->execute();

    $stmt->bind_result($hashedPassword);

    $stmt->fetch();

    if ($hashedPassword) {
        if (password_verify($submittedPassword, $hashedPassword)) {
            $_SESSION['regd'] = $regd;
            header("Location: http://localhost/laundry-mgt/Student/student.php");
            exit();
        } else {
            echo "<script>alert('Invalid password. Please try again.');</script>";
        }
    } else {
        echo "<script>alert('No user found with the given registration ID.');</script>";
    }

    $stmt->close();
    $conn->close();
    }
?>

