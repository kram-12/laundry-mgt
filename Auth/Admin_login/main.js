const passwordBtn = document.getElementById("password-eye");

passwordBtn.addEventListener("click", (e) => {
  const passwordInput = document.getElementById("password");
  const icon = passwordBtn.querySelector("i");
  const isVisible = icon.classList.contains("ri-eye-line");
  passwordInput.type = isVisible ? "password" : "text";
  icon.setAttribute("class", isVisible ? "ri-eye-off-line" : "ri-eye-line");
});


const dummyData = {
  email: "demo@srmap.edu.in",
  password: "123456"
};


function validateEmail(email) {
  const emailRegex = /^[a-zA-Z0-9._%+-]+@(?:srmap\.edu\.in)$/;
  return emailRegex.test(email);
}


function validatePassword(password) {
  return password.length >= 6;
}


function handleSubmit(event) {
  event.preventDefault();
  const emailInput = document.querySelector('input[type="email"]');
  const passwordInput = document.querySelector('input[type="password"]');
  
  const email = emailInput.value;
  const password = passwordInput.value;

  if (!validateEmail(email)) {
    alert("Please enter a valid SRMAP email address.");
    return;
  }

  if (!validatePassword(password)) {
    alert("Password must be at least 6 characters long.");
    return;
  }

  if (email === dummyData.email && password === dummyData.password) {
    window.location.href = "http://localhost/Laundry-Automation/Admin/admin.php";
  } else {
    alert("Invalid email or password.");
  }
}

document.querySelector("form").addEventListener("submit", handleSubmit);