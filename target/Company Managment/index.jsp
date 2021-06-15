<html>
<body>
<h2>ثبتنام کاربر</h2>
<form action="register" method="get">
    <div class="container">
        <h1>ثبتنام کاربر</h1>

        <label for="name"><b>نام</b></label>
        <input type="text"  name="name" id="name" required>

        <label for="lastname"><b>نام خانوادگی</b></label>
        <input type="text"  name="lastname" id="lastname" required>

        <label for="email"><b>آدرس ایمیل</b></label>
        <input type="text" name="email" id="email" required>

        <label for="password"><b>کلمه عبور</b></label>
        <input type="text" name="password" id="password" required>

        <label for="re-password"><b>کلمه عبور</b></label>
        <input type="text" name="re-password" id="re-password" required>

        <label for="group"><b>گروه شغلی</b></label>
        <select name="group" id="group">
            <option value="programer">برنامه نویس</option>
            <option value="tester">تست نویس</option>
            <option value="managerprogrammer">مدیر برنامه نویس</option>
            <option value="managertester">مدیر تست</option>
        </select>
        <button type="submit" class="registerbtn">ثبتنام</button>
    </div>

    <div class="container signin">
        <p>Already have an account? <a href="#">Sign in</a>.</p>
    </div>
</form>
</body>
</html>
