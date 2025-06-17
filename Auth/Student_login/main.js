const passwordBtn = document.getElementById("password-eye");

passwordBtn.addEventListener("click", (e) => {
  const passwordInput = document.getElementById("password");
  const icon = passwordBtn.querySelector("i");
  const isVisible = icon.classList.contains("ri-eye-line");
  passwordInput.type = isVisible ? "password" : "text";
  icon.setAttribute("class", isVisible ? "ri-eye-off-line" : "ri-eye-line");
});


function validateEmail(text) {
  return true;
}


function validatePassword(password) {
  return password.length >= 6;
}

function handleSubmit(event) {
  event.preventDefault();
  
  const regdInput = document.querySelector('input[type="text"]');
  const passwordInput = document.querySelector('input[type="password"]');
  
  const regd = regdInput.value;
  const password = passwordInput.value;

  console.log('Sending:', `regd=${regd}, password=${password}`);

  const xhr = new XMLHttpRequest();
  xhr.open('POST', 'http://localhost/Laundry-Automation/Auth/validate_login.php', true);
  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

  xhr.send(`regd=${encodeURIComponent(regd)}&password=${encodeURIComponent(password)}`);

  xhr.onload = function() {
    if (xhr.status === 200) {
      console.log('Response:', xhr.responseText);

      if (xhr.responseText.trim() === 'success') {
        window.location.href = `http://localhost/Laundry-Automation/Student/student.php?regd=${encodeURIComponent(regd)}`;
      } else {
        alert('Invalid registration ID or password.');
      }
    } else {
      alert('An error occurred. Please try again.');
    }
  };
}

