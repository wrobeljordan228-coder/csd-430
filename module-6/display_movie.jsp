<%--
	Jordan Wrobel
	11/21/2026
	CSD-430 Module 6.3
	Receive the selected movie_id primary key from select_movie.jsp,
	queries the matching row from CSD430.jordanmoviesdata using
	the InceptionRecord JavaBean, and displaying 5 fields in an HTML
	table.
	"This is what the command prompt is saying." 
	prompt. Gemini, Google, 21 November 2026,
	https://gemini.google.com/app.
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="movieBean" class="com.csd430.model.InceptionRecord" scope="page" />

<%
    // Read the selected primary key submitted from select_movie.jsp
    String idParam = request.getParameter("movie_id");
    boolean recordFound = false;

    if (idParam != null && !idParam.isEmpty()) {
        int selectedId = Integer.parseInt(idParam);
        recordFound = movieBean.loadMovieById(selectedId);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CSD-430 Movie Record Details</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h1>CSD-430 Movie Record Details</h1>

        <p class="description">
            <strong>Overall Data Description:</strong> The <code>jordanmoviesdata</code> table
            stores curated film metadata inside the <code>CSD430</code> MySQL database,
            retrieved dynamically through JDBC using the <code>InceptionRecord</code> JavaBean.
        </p>

        <h2>Field Descriptions</h2>
        <ul>
            <li><strong>Movie ID (<code>movie_id</code>):</strong> Auto-incremented integer primary key uniquely identifying each movie record.</li>
            <li><strong>Title (<code>title</code>):</strong> Official release title of the motion picture.</li>
            <li><strong>Director (<code>director</code>):</strong> Primary credited film director.</li>
            <li><strong>Release Year (<code>release_year</code>):</strong> Four-digit theatrical release year.</li>
            <li><strong>Rating (<code>rating</code>):</strong> Audience/critic review score on a 10-point decimal scale.</li>
        </ul>

        <%
            if (recordFound) {
        %>
            <h2>Selected Record Description</h2>
            <p>
                Showing database record <strong>#<%= movieBean.getMovieId() %></strong>:
                <em><%= movieBean.getTitle() %></em> (<%= movieBean.getReleaseYear() %>),
                directed by <%= movieBean.getDirector() %> with a rating of
                <%= movieBean.getRating() %>/10.
            </p>

            <table border="1" cellpadding="8" cellspacing="0">
                <thead>
                    <tr>
                        <th>Movie ID</th>
                        <th>Title</th>
                        <th>Director</th>
                        <th>Release Year</th>
                        <th>Rating</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%= movieBean.getMovieId() %></td>
                        <td><%= movieBean.getTitle() %></td>
                        <td><%= movieBean.getDirector() %></td>
                        <td><%= movieBean.getReleaseYear() %></td>
                        <td><%= movieBean.getRating() %></td>
                    </tr>
                </tbody>
            </table>
        <%
            } else {
        %>
            <p><strong>No movie record was found for the selected Movie ID.</strong></p>
        <%
            }
        %>

        <br>
        <p>
            <a href="select_movie.jsp">Select Another Movie</a> |
            <a href="index.jsp">Return to Project Home</a>
        </p>
    </div>
</body>
</html>