<%--
	Jordan Wrobel
	11/21/2026
	CSD-430 Module 6.3
	Use an HTML form with a dropdown menu populated from primary keys
	stored in the CSD430.jordanmoviesdata MySQL database table from
	the InceptionRecord JavaBean.
	"i tried to run on server and this is what i got. Is this to be expected?" 
	prompt. Gemini, Google, 21 November 2026,
	https://gemini.google.com/app.
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<jsp:useBean id="movieBean" class="com.csd430.model.InceptionRecord" scope="page" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CSD-430 Movie Database Lookup</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h1>CSD-430 Movie Database Lookup</h1>
        <p class="description">
            <strong>Overall Data Description:</strong> This application queries the
            <code>CSD430.jordanmoviesdata</code> MySQL database table using a JavaBean
            (<code>InceptionRecord</code>). Use the dropdown menu below to select a
            unique primary key (<code>movie_id</code>) and inspect its full record.
        </p>

        <form action="display_movie.jsp" method="post">
            <label for="movie_id"><strong>Select Movie ID (Primary Key):</strong></label>
            <select name="movie_id" id="movie_id" required>
                <option value="">-- Choose a Movie ID --</option>
                <%
                    // Retrieve all primary key values from jordanmoviesdata via JavaBean
                    List<Integer> movieIds = movieBean.getMovieIds();
                    for (Integer id : movieIds) {
                %>
                    <option value="<%= id %>"><%= id %></option>
                <%
                    }
                %>
            </select>
            <br><br>
            <button type="submit">Display Movie Record</button>
        </form>

        <br>
        <p><a href="index.jsp">Return to Project Home</a></p>
    </div>
</body>
</html>