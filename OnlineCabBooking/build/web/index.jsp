<%-- 
    Document   : index
    Created on : 24 Aug, 2024, 7:40:48 PM
    Author     : helLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to the Online Cab Booking System</title>
    <style>
        /* Updated gradient background to blue */
        body {
            background: linear-gradient(135deg, #4a90e2, #5a6ee1);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            text-align: center;
            color: #333;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            overflow: hidden; /* Prevent scroll bars */
        }

        /* Modern heading style */
        h1 {
            color: #fff;
            font-size: 2.5em;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        /* Refined form style */
        form {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 320px;
        }

        /* Input and select styling */
        input[type="text"], select {
            width: calc(100% - 22px);
            padding: 10px;
            margin: 10px 0;
            border-radius: 8px;
            border: 1px solid #ddd;
            outline: none;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus, select:focus {
            border-color: #4a90e2;
        }

        /* Submit button styling */
        input[type="submit"] {
            background-color: #4a90e2;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #3a6fd8;
        }

        /* Link styling */
        a {
            font-weight: bold;
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #5a6ee1;
        }

        /* Fare display styling */
        #fareDisplay {
            color: #fff;
            font-weight: bold;
            margin-top: 20px;
            font-size: 1.2em;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        /* Background image update */
        body::before {
            content: "";
            background-image: url('taxi-image-url'); /* Replace with the actual URL of your taxi image */
            background-size: cover;
            background-position: center;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0.15; /* Reduced opacity for better readability */
            z-index: -1;
        }

        /* Paragraph and success message styling */
        p {
            color: #fff;
            margin: 10px 0;
        }

        p.success {
            color: #28a745;
        }
    </style>
    <script>
        // JavaScript to dynamically calculate and display fare
        function calculateFare() {
            const fareMap = {
                "Location A-Location F": 100,
                "Location A-Location G": 120,
                "Location B-Location H": 80,
                "Location C-Location I": 150,
                "Location D-Location J": 200
            };

            let pickup = document.getElementById("pickupLocation").value;
            let drop = document.getElementById("dropLocation").value;
            let route = pickup + "-" + drop;
            let fare = fareMap[route] || 0;
            document.getElementById("fareDisplay").innerText = "Fare: ₹" + fare;
        }
    </script>
</head>
<body>
    <h1>Welcome to the Online Cab Booking System</h1>
    
    <% 
        String bookingSuccess = (String) session.getAttribute("bookingSuccess");
        if (bookingSuccess != null) { 
    %>
        <p class="success"><%= bookingSuccess %></p>
        <%
            session.removeAttribute("bookingSuccess");
        }
    %>

    <% 
        String username = (String) session.getAttribute("username");
        if (username != null) { 
    %>
        <p>Hello, <%= username %>! <a href="logout.jsp">Logout</a></p>
        <form action="book" method="post">
            Name: <input type="text" name="name" required><br>
            
            Pickup Location: 
            <select id="pickupLocation" name="pickupLocation" onchange="calculateFare()" required>
                <option value="">Select Pickup Location</option>
                <option value="Location A">Borivali</option>
                <option value="Location B">Malad</option>
                <option value="Location C">Kandivali</option>
                <option value="Location D">Goregaon</option>
                <option value="Location E">Andheri</option>
            </select>
            <br>
            
            Drop Location: 
            <select id="dropLocation" name="dropLocation" onchange="calculateFare()" required>
                <option value="">Select Drop Location</option>
                <option value="Location F">Vile Parle</option>
                <option value="Location G">Dhaisar</option>
                <option value="Location H">Santacruz</option>
                <option value="Location I">Dadar</option>
                <option value="Location J">Bandra</option>
            </select>
            <br>
            
            Select Cab Type: 
            <select name="cabType">
                <option value="Sedan">Sedan</option>
                <option value="SUV">SUV</option>
                <option value="Mini">Mini</option>
            </select>
            <br>
            
            <input type="submit" value="Book Now">
        </form>
        
        <p id="fareDisplay">Fare: ₹0</p>
        
        <p><a href="bookingHistory.jsp">View Booking History</a></p>
        
    <% } else { %>
        <p>Please <a href="login.jsp">Login</a> or <a href="register.jsp">Register</a> to book a cab.</p>
    <% } %>
</body>
</html>
