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
<%@ page import="java.util.List" %>
<%@ page import="com.csd430.model.InceptionRecord" %>
<jsp:useBean id="movieBean" class="com.csd430.model.InceptionRecord" scope="page" />

<%
    // Gather submitted form values from add_movie.jsp
    String titleParam = request.getParameter("title");
    String directorParam = request.getParameter("director");
    String yearParam = request.getParameter("release_year");
    String ratingParam = request.getParameter("rating");

    boolean insertSuccess = false;

    if (titleParam != null && directorParam != null && yearParam != null && ratingParam != null) {
        int releaseYear = Integer.parseInt(yearParam.trim());
        double rating = Double.parseDouble(ratingParam.trim());
        insertSuccess = movieBean.insertMovie(titleParam.trim(), directorParam.trim(), releaseYear, rating);
    }

    // Retrieve all records (including the newly added row) from jordanmoviesdata
    List<InceptionRecord> allMovies = movieBean.getAllMovies();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CSD-430 All Movie Records</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h1>CSD-430 Complete Movie Database Table</h1>

        <% if (insertSuccess) { %>
            <p><strong>Success:</strong> Added <em><%= titleParam %></em> (<%= yearParam %>) to the database.</p>
        <% } else { %>
            <p><strong>Notice:</strong> Displaying all current records in <code>CSD430.jordanmoviesdata</code>.</p>
        <% } %>

        <p class="description">
            <strong>Overall Data Description:</strong> This table displays all motion picture
            records currently stored in the <code>CSD430.jordanmoviesdata</code> MySQL database,
            retrieved dynamically through the <code>InceptionRecord</code> JavaBean after assigning
            each new entry an auto-incremented <code>movie_id</code> primary key.
        </p>

        <h2>Field Descriptions</h2>
        <ul>
            <li><strong>Movie ID (<code>movie_id</code>):</strong> Auto-incremented integer primary key assigned by MySQL upon insertion.</li>
            <li><strong>Title (<code>title</code>):</strong> Official theatrical release title of the film.</li>
            <li><strong>Director (<code>director</code>):</strong> Primary credited film director.</li>
            <li><strong>Release Year (<code>release_year</code>):</strong> Four-digit theatrical release year.</li>
            <li><strong>Rating (<code>rating</code>):</strong> Audience/critic review score on a 10-point decimal scale.</li>
        </ul>

        <h2>All Database Records (<%= allMovies.size() %> Total)</h2>
        <p>
            <strong>Record Description:</strong> Each row below represents a complete movie entity
            from <code>jordanmoviesdata</code>, ordered ascending by its primary key (<code>movie_id</code>).
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
                <%
                    for (InceptionRecord movie : allMovies) {
                %>
                    <tr>
                        <td><%= movie.getMovieId() %></td>
                        <td><%= movie.getTitle() %></td>
                        <td><%= movie.getDirector() %></td>
                        <td><%= movie.getReleaseYear() %></td>
                        <td><%= movie.getRating() %></td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <br>
        <p>
            <a href="add_movie.jsp">Add Another Movie</a> |
            <a href="select_movie.jsp">Lookup Single Movie by ID</a> |
            <a href="index.jsp">Return to Project Home</a>
        </p>
    </div>
</body>
</html>