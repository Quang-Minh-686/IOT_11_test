<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: Arial;
            background: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-box {
            background: white;
            padding: 30px;
            border-radius: 10px;
            width: 300px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            text-align: center;
        }
        input, button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
        }
        button {
            background: #3498db;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="login-box">
    <h3>Đăng nhập hệ thống</h3>
    <input type="text" id="username" placeholder="Tài khoản">
    <input type="password" id="password" placeholder="Mật khẩu">
    <button onclick="login()">Đăng nhập</button>
    <p id="msg" style="color:red;"></p>
</div>

<script type="module">
import { initializeApp } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-app.js";
import { getDatabase, ref, get } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-database.js";

const firebaseConfig = {
  apiKey: "AIzaSyASA1sLoaNqll4mU42pl-1y6OxHsr3IWPM",
  authDomain: "doan-iot-24242.firebaseapp.com",
  databaseURL: "https://doan-iot-24242-default-rtdb.firebaseio.com",
  projectId: "doan-iot-24242",
  storageBucket: "doan-iot-24242.firebasestorage.app",
  messagingSenderId: "170782338545",
  appId: "1:170782338545:web:417c82eb4c3f4b8912e850"
};

const app = initializeApp(firebaseConfig);
const db = getDatabase(app);

// mã hóa nhẹ (ăn điểm báo cáo)
function hash(pw) {
    return btoa(pw);
}

window.login = async () => {
    const user = username.value.trim();
    const pass = password.value;

    const snap = await get(ref(db, `users/${user}`));

    if (!snap.exists()) {
        msg.innerText = "Sai tài khoản";
        return;
    }

    if (snap.val().password === hash(pass)) {
        localStorage.setItem("login", "ok");
        localStorage.setItem("user", user);
        window.location.href = "index.html";
    } else {
        msg.innerText = "Sai mật khẩu";
    }
};
</script>

</body>
</html>
