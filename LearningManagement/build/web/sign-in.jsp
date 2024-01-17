<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="assets/img/?Pngtree?blue open book_4426437.png">
        <title>EduPro - Online Learning</title>
    </head>
    <link href="assets/css/sign-in.css" rel="stylesheet" type="text/css" media="all">
    <style>
        body {
            background: url(assets/img/sanhAlpha.png);
            background-size: cover;
            background-repeat: no-repeat;
        }
        .btn-check{
            size: 0.5rem;
            width: 50%;
            margin: auto;
        }
        .fab {
            text-decoration: none;
        }
        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }

        /* Hide default HTML checkbox */
        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        /* The slider */
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

        input:checked+.slider {
            background-color: #2196F3;
        }

        input:focus+.slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked+.slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

        .slider.round:before {
            border-radius: 50%;
        }
    </style>
    <body>
        <%@include file="components/header-signIn-signUp.jsp" %>
        <form action="sign-in" method="post" style="background-color: #f2f2f2; padding: 30 30 30 30" onsubmit="return validateForm()">
            <h3 style="color: #06BBCC">Sign in</h3>
            <div style="color: #06BBCC">
                ${requestScope.msg}
            </div>
            <%
            String errorMsg = (String) session.getAttribute("msg");
                if (errorMsg != null && !errorMsg.isEmpty()) {
            %>
            <div style="color: #06BBCC">
                <%= errorMsg %>
            </div>
            <%
                // X�a th�ng b�o sau khi hi?n th?
                session.removeAttribute("msg");
                }
            %>
            <label style="color: #06BBCC" for="username">Username</label>
            <input style="color: #000" type="text" placeholder="Email or phone number" name="username" required="">

            <label style="color: #06BBCC" for="password">Password</label>
            <input style="color: #000" type="password" placeholder="Password" name="password" required="">
            <label class="switch">
                <input class=" btn-check" name="isRemeberMe" type="checkbox" id="rememberMe" checked style="transform: scale(0.5);"> 
                <span class="slider round" ></span>
                <h4  style="color: #06BBCC; margin-left: 70px; font-size: 80%">Remember me</h4>
            </label>
            <a href="${GOOGLE_LOGIN_HREF}" class="google-btn" style="width: 184px; height: 42px; background-color: #4285f4; border-radius: 2px; box-shadow: 0 3px 4px 0 rgba(0,0,0,.25); text-decoration: none; display: inline-block; position: relative; margin-left: 78px">
                <div class="google-icon-wrapper" style="position: absolute; margin-top: 1px; margin-left: 1px; width: 40px; height: 40px; border-radius: 2px; background-color: #fff; ">
                    <img class="google-icon" src="https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg" style="position: absolute; margin-top: 11px; margin-left: 11px; width: 18px; height: 18px;">
                </div>
                <p class="btn-text" style="float: right; margin: 11px 11px 0 0; color: #fff; font-size: 14px; letter-spacing: 0.2px; font-family: 'Roboto';">Continue with Google</p>
            </a>
            <button style="color: #06BBCC" type="submit">SIGN IN</button>
            <div class="social" style="margin-top: 20px">


                <a href="sign-up" style= "text-decoration: none;white-space: nowrap; margin-left: 40px">Sign Up</a>
                <a href="reset-password.jsp" style=" margin-left: 50px">Forgot password?</a>
            </div>


        </form>
        <!--        <script>
                    function validateForm() {
                        var username = document.forms["signInForm"]["username"].value;
                        var password = document.forms["signInForm"]["password"].value;
        
                        // Regular expression for a valid email address
                        var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        
                        // Regular expression for a valid phone number (assuming 10 digits)
                        var phoneRegex = /^\d{10}$/;
        
                        if (!emailRegex.test(username) && !phoneRegex.test(username)) {
                            alert("Please enter a valid email address or phone number.");
                            return false;
                        }
                        // Add additional validation for the password if needed
                        return true;
                    }
                </script>-->
    </body>

</html>
