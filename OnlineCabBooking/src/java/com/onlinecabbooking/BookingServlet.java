package com.onlinecabbooking;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/book")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Static map to store pre-decided fare for each route
    private static final Map<String, Integer> fareMap = new HashMap<>();
    
    static {
        fareMap.put("Location A-Location F", 100);
        fareMap.put("Location A-Location G", 120);
        fareMap.put("Location B-Location H", 80);
        fareMap.put("Location C-Location I", 15);
        fareMap.put("Location D-Location J", 20);
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Get booking details from the request
    String name = request.getParameter("name");
    String pickupLocation = request.getParameter("pickupLocation");
    String dropLocation = request.getParameter("dropLocation");
    String cabType = request.getParameter("cabType");

    
    String route = pickupLocation + "-" + dropLocation;
    Integer fare = fareMap.get(route);

    if (fare == null) {
        fare = 0; 
    }

   
    String bookingDetails = "Name: " + name + ", Pickup: " + pickupLocation + ", Drop: " + dropLocation + ", Cab: " + cabType + ", Fare: ₹" + fare;

   
    HttpSession session = request.getSession();
    List<String> bookingHistory = (List<String>) session.getAttribute("bookingHistory");

  
    if (bookingHistory == null) {
        bookingHistory = new ArrayList<>();
    }

    // Add the new booking to the history
    bookingHistory.add(bookingDetails);

    // Update the session attribute
    session.setAttribute("bookingHistory", bookingHistory);

    // Set fare attribute to display it on index.jsp
    request.setAttribute("fare", String.valueOf(fare));

    // Forward back to index.jsp with fare displayed
    request.getRequestDispatcher("index.jsp").forward(request, response);
}
}