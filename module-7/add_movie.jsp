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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CSD-430 Add New Movie Record</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h1>Add a New Movie Record</h1>
        <p class="description">
            <strong>Overall Data Description:</strong> Complete the form below to insert a new
            motion picture record into the <code>CSD430.jordanmoviesdata</code> MySQL database
            table. The <code>movie_id</code> primary key is generated automatically by MySQL.
        </p>

        <form action="insert_movie.jsp" method="post">
            <label for="title"><strong>Movie Title:</strong></label><br>
            <input type="text" id="title" name="title" placeholder="e.g., Interstellar" required>
            <br><br>

            <label for="director"><strong>Director:</strong></label><br>
            <input type="text" id="director" name="director" placeholder="e.g., Christopher Nolan" required>
            <br><br>

            <label for="release_year"><strong>Release Year:</strong></label><br>
            <input type="number" id="release_year" name="release_year" min="1888" max="2030" placeholder="e.g., 2014" required>
            <br><br>

            <label for="rating"><strong>Rating (0.0 – 10.0):</strong></label><br>
            <input type="number" id="rating" name="rating" step="0.1" min="0.0" max="10.0" placeholder="e.g., 8.7" required>
            <br><br>

            <button type="submit">Add Movie to Database</button>
        </form>

        <br>
        <p>
            <a href="select_movie.jsp">Lookup Existing Movie</a> |
            <a href="index.jsp">Return to Project Home</a>
        </p>
    </div>
</body>
</html>