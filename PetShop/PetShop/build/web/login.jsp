<%-- 
    Document   : login
    Created on : Oct 18, 2023, 9:41:14 AM
    Author     : ThuyVy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Petshop Login</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f1f1f1;
                margin: 0;
                padding: 20px;
            }

            .login-container {
                background-color: #fff;
                max-width: 400px;
                margin: 0 auto;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin-top: 50px;
            }
            
            form {
                background-color: #fff;
                width: 90%;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                /*text-align: center;*/
            }
            
            .login-container h2 {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }

            .login-container input[type="text"],
            .login-container input[type="password"] {
                width: 95%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .login-container input[type="submit"] {
                width: 100%;
                padding: 10px;
                border: none;
                border-radius: 5px;
                background-color: #4CAF50;
                color: white;
                cursor: pointer;
            }

            .login-container input[type="submit"]:hover {
                background-color: #45a049;
            }

            .button-container {
                display: flex;
                justify-content: space-between;
            }


            .login-container input[type="reset"],
            .login-container input[type="button"] {
                width: 47%; /* Adjust the width as needed */
                padding: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-align: center;
            }



            .login-container input[type="reset"] {
                background-color: #f44336;
                color: white;
                margin-top: 10px;
            }

            .login-container input[type="reset"]:hover {
                background-color: #d32f2f;
            }

            /* Style for the "Sign Up" button */
            .login-container input[type="button"] {
                background-color: #007BFF; /* Change to your desired color */
                color: white;
                margin-top: 10px;
            }

            .login-container input[type="button"]:hover {
                background-color: #0056b3; /* Change to your desired hover color */
            }


        </style>
    </head>
    <body>
        <div class="login-container">
            <h2>Petshop Login</h2>
            <form action="login" method="POST">
                Username:<input type="text" name="Username" value="" /><br>
                Password:<input type="password" name="Password" value="" /><br>
                
                    <input type="submit" value="Login" />
                    <div class="button-container">
                    <input type="reset" value="Reset" />
                    <input type="button" value="Sign Up" onclick="location.href = 'signup'" />
                </div>

                ${mess}
            </form>

        </div>
    </body>
</html>

