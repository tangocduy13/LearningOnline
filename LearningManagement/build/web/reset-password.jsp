<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="shortcut icon" href="assets/img/?Pngtree?blue open book_4426437.png">
        <title>EduPro - Online Learning</title>
    </head>
    <link href="assets/css/sign-up.css?v=3" rel="stylesheet" type="text/css" media="all">
    <body style="
          background: url(assets/img/sanhAlpha.png);">
        <%@include file="components/header-signIn-signUp.jsp" %>
        <form style="background-color: #f2f2f2">
            <br><br>
            <h2 style="color: #06BBCC">Forgot password</h2>
            <br>
            <button style="margin-top: 10px" id="sendMail" type="button" onclick="location.href = '/LearningManagement/reset-password-byMail';">Reset with email</button>
            <button style="margin-top: 10px" id="sendSms" type="button"onclick="location.href = 'reset-password-bySMS.jsp';" >Reset with phone number </button>
            <br>
            <br>
            <div style="color: #b5bccaed">
                ${requestScope.msg}
            </div>
            Adready have account?<a href="sign-in" style="margin-left: 50px; " >Sign In</a>
            <br>
        </form>
    </body>

</html>