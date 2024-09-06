<%-- 
    Document   : register
    Created on : 24 Aug, 2024, 7:29:41 PM
    Author     : helLO
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <style>
        /* Importing Google Font */
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

        /* Global styles */
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #333;
        }

        /* Container for form */
        .register-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        /* Header style */
        h1 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        /* Input fields */
        label {
            display: block;
            margin: 15px 0 5px;
            text-align: left;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        /* Submit button */
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #5cb85c;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #4cae4c;
        }

        /* Login link */
        p {
            margin-top: 15px;
            font-size: 14px;
        }

        a {
            color: #5cb85c;
            font-weight: bold;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h1>Register</h1>
        <form action="WelcomeServlet" method="post">
            <input type="hidden" name="action" value="register">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Register">
        </form>
        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </div>
</body>
</html>
