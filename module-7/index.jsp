<%--
	Jordan Wrobel
	11/24/2026
	CSD-430 Module 7.2
	We are using our database and table from the previous module. We are supposed to
	add a form that can add a new entry to the table. The returning form should
	display all data in a table.
	"Hey Gemini, I'm doing my next assignment for CSD 430 and it is adding to the previous 
	assignment. Do you remember the last assignment?" prompt. Gemini, Google, 24 November 2026,
	https://gemini.google.com/app.
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP Server Environment Test</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f7f9fc;
            color: #333;
        }
        .card {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 25px 30px;
            max-width: 600px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #0056b3;
            margin-top: 0;
        }
        .status-badge {
            display: inline-block;
            background-color: #28a745;
            color: white;
            padding: 4px 10px;
            border-radius: 4px;
            font-size: 0.9em;
            font-weight: bold;
        }
        ul {
            line-height: 1.8;
        }
    </style>
</head>
<body>

    <div class="card">
        <h1>Jakarta Tomcat & JSP Verification</h1>
        <p><span class="status-badge">Server Online</span></p>

        <%
            // Java Code Execution: Capture dynamic server-side time and environment details
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String formattedDate = now.format(formatter);
            String javaVersion = System.getProperty("java.version");
            String serverInfo = application.getServerInfo();
        %>

        <p>This page confirms that <strong>HTML5</strong> markup and <strong>Java Server Pages</strong> are executing properly on the server.</p>

        <h3>Environment Details:</h3>
        <ul>
            <li><strong>Current Server Time:</strong> <%= formattedDate %></li>
            <li><strong>Java Runtime Version:</strong> <%= javaVersion %></li>
            <li><strong>Servlet Container:</strong> <%= serverInfo %></li>
            <li><a href="user_form.jsp">Module 3: User Input Form</a></li>
            <li><a href="display_inception.jsp">Module 4: JavaBean Movie Record Display</a></li>
            <li><a href="select_movie.jsp">Module 6.3: Movie Database Lookup</a></li>
            <li><a href="add_movie.jsp">Project Part 2: Add New Movie Record</a></li>
        </ul>
    </div>

</body>
</html>