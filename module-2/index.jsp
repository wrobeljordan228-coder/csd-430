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
        </ul>
    </div>

</body>
</html>