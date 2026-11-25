package com.csd430.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * ============================================================================
 * name:			 Jordan Wrobel
 * date:			 11/13/2026
 * assignment:   Module 4.2
 * Class Name:   InceptionRecord
 * Description:  JavaBean encapsulating domain entity data for the movie Inception.
 * Standards:    Implementing java.io.Serializable, containing a public no-argument
 *               constructor, private fields, and standard public accessors/mutators.
 * Minimum Fields: 5 properties (category, name, role, dreamDepth, description).
 * Works Cited:  "can you help me create a javabean to hold some data" prompt. Gemini, 
 * 				 Google, 13 Nov. 2026, https://gemini.google.com/app.
 * ============================================================================
 */
public class InceptionRecord implements Serializable {

    // Unique serialization identifier for Serializable compliance
    private static final long serialVersionUID = 1L;

 // Database connection settings using your student1 MySQL account
    private final String url = "jdbc:mysql://localhost:3306/CSD430?useSSL=false";
    private final String dbUser = "student1";
    private final String dbPass = "pass";
    
 // JavaBean fields matching jordanmoviesdata columns
    private int movieId;
    private String title;
    private String director;
    private int releaseYear;
    private double rating;
    
    // --- 5 Core Properties ---
    private String category;      // Field 1: Topical grouping (Cast, Totem, Tech, Rule)
    private String name;          // Field 2: Character, object, or concept name
    private String role;          // Field 3: Specific function or job role
    private int dreamDepth;       // Field 4: Associated subconscious dream level (0-4)
    private String description;   // Field 5: Comprehensive narrative summary

    /**
     * Mandatory public no-argument constructor for JavaBean specification.
     */
    public InceptionRecord() {
    }

    /**
     * Parameterized convenience constructor for clean data instantiation.
     */
    public InceptionRecord(String category, String name, String role, int dreamDepth, String description) {
        this.category = category;
        this.name = name;
        this.role = role;
        this.dreamDepth = dreamDepth;
        this.description = description;
    }
    public InceptionRecord(String category, String name, String role, String description) {
        this.category = category;
        this.name = name;
        this.role = role;
        this.description = description;
    }
    
    // --- Public Getters and Setters ---
    public int getMovieId() { return movieId; }
    public void setMovieId(int movieId) { this.movieId = movieId; }
    
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    
    public String getDirector() { return director; }
    public void setDirector(String director) { this.director = director; }
    
    public int getReleaseYear() { return releaseYear; }
    public void setReleaseYear(int releaseYear) { this.releaseYear = releaseYear; }
    
    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getDreamDepth() {
        return dreamDepth;
    }

    public void setDreamDepth(int dreamDepth) {
        this.dreamDepth = dreamDepth;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
 // --- Method 1: Gather all primary keys for the HTML dropdown ---
    public List<Integer> getMovieIds() {
        List<Integer> ids = new ArrayList<>();
        String sql = "SELECT movie_id FROM jordanmoviesdata ORDER BY movie_id ASC";

        try {
            Class.forName("com.mysql.jdbc.Driver"); // Use com.mysql.cj.jdbc.Driver if using Connector/J 8+
            try (Connection conn = DriverManager.getConnection(url, dbUser, dbPass);
                 PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    ids.add(rs.getInt("movie_id"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ids;
    }
 // --- Method 2: Populate this bean with a specific movie's details ---
    public boolean loadMovieById(int id) {
        String sql = "SELECT movie_id, title, director, release_year, rating FROM jordanmoviesdata WHERE movie_id = ?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(url, dbUser, dbPass);
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                ps.setInt(1, id);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        this.movieId = rs.getInt("movie_id");
                        this.title = rs.getString("title");
                        this.director = rs.getString("director");
                        this.releaseYear = rs.getInt("release_year");
                        this.rating = rs.getDouble("rating");
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}