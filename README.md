# Laundry Automation System

**Laundry Automation System** is a web application designed to streamline and digitize the laundry management process in college dormitories and shared living spaces. With features like **QR code scanning**, **real-time tracking**, and **email notifications**, this system reduces wait times, eliminates manual tracking, and improves overall user experience.

---

## 🛠️ Installation

### Clone the Repository:

```bash
https://github.com/kram-12/laundry-mgt.git
````

### Install XAMPP:

Download and install XAMPP from:
👉 [https://www.apachefriends.org/index.html](https://www.apachefriends.org/index.html)

### Start the XAMPP Server:

* Launch the **XAMPP Control Panel**
* Start **Apache** and **MySQL** services

### Open phpMyAdmin:

1. Visit: [http://localhost/phpmyadmin](http://localhost/phpmyadmin)
2. Create a new database named: `laundry`
3. Import the SQL file provided in the repository into the `laundry` database

### Update Localhost Configuration (if necessary):

If your local setup uses different credentials or port, update your database connection in PHP files accordingly:

```php
$servername = "localhost:3307";
$username = "root";
$password = "";
$database = "laundry";
```

### Move the Project Files:

* Copy or move the cloned folder into your XAMPP `htdocs` directory
  (e.g., `C:\xampp\htdocs\laundry-mgt`)

### Access the Project:

Open your browser and go to:
👉 [http://localhost/laundry-mgt](http://localhost/laundry-mgt)

---

## 🧾 Introduction

Waiting for washed laundry and searching among numerous bags is a common issue faced by college students living in dormitories. These laundry facilities often experience congestion and delays due to manual tracking and identification, which causes inconvenience and inefficiency.

---

## ❓ Problem Statement

The **Laundry Automation System** addresses the following challenges:

* Congestion and long wait times in laundry rooms
* Difficulty locating clean laundry among identical bags
* Manual and error-prone tracking systems

---

## ✅ Solution

A centralized web platform using **QR code scanning** and **real-time notifications** to automate laundry operations. This system improves the laundry process in places like hostels, dormitories, and shared living facilities.

---

## 🔄 Workflow

### 🧑‍💼 Admin Login

* **QR Code Pickup:** Admins scan QR codes on bags to register and verify pickups
* **Update & Notify:** After washing, bags are rescanned to update status and send email alerts

### 🧑‍🎓 Student Login

* **Check Status:** Students log in to view laundry status and rack number
* **Real-Time Updates:** Students get up-to-date info throughout the process

---

## 🚀 Key Features

* **Login Authentication:** Secure login for admins and students
* **QR Code Scanning:** Admin panel allows scanning to update laundry status
* **Backend Data Management:** Accurate, real-time updates stored in the `laundry` database
* **Email Notifications:** Automatic emails sent to students when laundry is done
* **Laundry Status Tracking:** Students can check washing status and rack location
* **Real-Time Updates:** Instant status changes reflected in student dashboard

---

## 🎁 Benefits

| Benefit              | Description                                                   |
| -------------------- | ------------------------------------------------------------- |
| Efficient Tracking   | Reduces manual work and errors with QR-based tracking         |
| Reduced Waiting Time | Real-time visibility eliminates unnecessary waiting           |
| Transparency         | Students know exactly when and where to pick up their laundry |
| User Convenience     | Simple dashboard for both students and admins                 |

---

## 💢 Pain Points Solved

* **Waiting Time:** Eliminated through automated tracking
* **Uncertainty:** Real-time updates reduce anxiety and guesswork
* **Manual Tracking:** QR scanning replaces spreadsheets and paper logs

---

## 📧 Contact

For inquiries or collaboration:
📨 [kalyanram.p.12@gmail.com](mailto:kalyanram.p.12@gmail.com)

---

> Built to simplify the everyday chore of laundry — one scan at a time.

```

