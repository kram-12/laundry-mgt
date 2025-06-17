<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="style.css" />
    <title>Admin Login - Laundry Automation</title>
  </head>
  <body>
    <div class="container">
      <div class="container__content">
        <div class="container__ele">
          <h1>Admin Log In</h1>
        </div>
        <form action="http://localhost/Laundry-Automation/Admin/admin.php">
          <label for="email">Email (Laundry Attendant)</label>
          <div class="input__row">
            <input type="email" placeholder="Enter Your Email" required/>
          </div>
          <div class="input__header">
            <label for="password">Password</label>
            <a href="#">Forgot Password?</a>
          </div>
          <div class="input__row">
            <input type="password" id="password" placeholder="Password" required/>
            <span id="password-eye"><i class="ri-eye-off-line"></i></span>
          </div>
          <button>LOGIN</button>
        </form>
      </div>
      <div class="container__image"></div>
    </div>
    <script src="main.js"></script>
  </body>
</html>