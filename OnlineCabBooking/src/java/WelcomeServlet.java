/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

@WebServlet("/WelcomeServlet")
public class WelcomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Static HashMap to store user credentials (in place of a database)
    private static HashMap<String, User> users = new HashMap<>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if ("register".equals(action)) {
            // Register user
            if (!users.containsKey(username)) {
                User newUser = new User(username, password);
                users.put(username, newUser);
                response.sendRedirect("login.jsp");
            } else {
                response.getWriter().println("Username already exists. Please choose a different username.");
            }
        } else if ("login".equals(action)) {
            // Authenticate user
            User user = users.get(username);
            if (user != null && user.getPassword().equals(password)) {
                request.getSession().setAttribute("username", username);
                response.sendRedirect("index.html");
            } else {
                response.getWriter().println("Invalid username or password. Please try again.");
            }
        }
    }
}
