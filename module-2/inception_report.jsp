/**
*Jordan Wrobel, 10/27/2026, Module 2.2
*Create an HTML page using JSP scriplets
*"Can you help me write a dynamic HTML page using JSP scriplets?" Prompt. Gemini, Google, 10/27/2026, https://gemini.google.com/app.
*/

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inception Movie</title>
    <!-- Link to external CSS stylesheet -->
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>

<%!
    /**
     * Inner class representing a single record.
     * Contains 4 fields: Category (topical grouping), Name, Function/Role, and Description.
     */
    public static class InceptionRecord {
        private String category;
        private String name;
        private String role;
        private String description;

        public InceptionRecord(String category, String name, String role, String description) {
            this.category = category;
            this.name = name;
            this.role = role;
            this.description = description;
        }

        public String getCategory() { return category; }
        public String getName() { return name; }
        public String getRole() { return role; }
        public String getDescription() { return description; }
    }
%>

<%
    // --- Data Initialization Scriptlet ---
    // Instantiate records related to the movie Inception grouped into topical categories
    List<InceptionRecord> recordList = new ArrayList<>();

    // Category 1: Extraction Team (Cast & Roles)
    recordList.add(new InceptionRecord(
        "Extraction Team", 
        "Dom Cobb", 
        "The Extractor", 
        "Master of subconscious infiltration and extraction of sensitive mental secrets."
    ));
    recordList.add(new InceptionRecord(
        "Extraction Team", 
        "Arthur", 
        "The Point Man", 
        "Manages logistics, detailed research, and physical safeguards during dream states."
    ));
    recordList.add(new InceptionRecord(
        "Extraction Team", 
        "Ariadne", 
        "The Architect", 
        "Designs intricate, recursive dream mazes to keep the subject unaware of deception."
    ));
    recordList.add(new InceptionRecord(
        "Extraction Team", 
        "Eames", 
        "The Forger", 
        "Assumes identities and body language of trusted confidants inside the subconscious."
    ));
    recordList.add(new InceptionRecord(
        "Extraction Team", 
        "Yusuf", 
        "The Chemist", 
        "Formulates powerful, compound sedatives necessary to reach multi-level dream depths."
    ));

    // Category 2: Core Concept Artifacts
    recordList.add(new InceptionRecord(
        "Core Concepts & Artifacts", 
        "Spinning Top", 
        "Totem", 
        "A small weighted brass top used to verify whether the user is in reality or a dream."
    ));
    recordList.add(new InceptionRecord(
        "Core Concepts & Artifacts", 
        "PASIV Device", 
        "Hardware Injector", 
        "Portable Automated Somnacin IntraVenous system enclosed in a military briefcase."
    ));
    recordList.add(new InceptionRecord(
        "Core Concepts & Artifacts", 
        "The Kick", 
        "Safety Mechanism", 
        "A sudden physical jolt (e.g., falling in water) that snaps the dreamer awake."
    ));

    // Format current server generation timestamp
    String serverTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
%>

<div class="container">
    <!-- Page Header and Overall Data Description -->
    <h1>Project Inception: Archive Records</h1>
    <p class="description">
        This document provides a collection of personnel information and technical equipment logs 
        pertaining to the shared dreaming operation depicted in Christopher Nolan&apos;s film <em>Inception</em> (2010). 
        All records are categorized by their purpose.
    </p>

    <!-- Field and Record Description Metadata Panel -->
    <div class="metadata-panel">
        <p><strong>Total Loaded Records:</strong> <%= recordList.size() %></p>
        <p><strong>Primary Fields:</strong> Entity Identifier (Subject), Function / Specialization, Operational Notes</p>
        <p><strong>Server Generation Timestamp:</strong> <%= serverTime %></p>
    </div>

    <!-- Data Presentation Table -->
    <table>
        <thead>
            <tr>
                <th>Subject / Entity</th>
                <th>Designation / Role</th>
                <th>Operational Notes</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Variable to track category grouping transitions
                String currentCategory = "";

                // Loop through each record using Java Scriptlets while outputting HTML tags outside
                for (InceptionRecord item : recordList) {
                    
                    // Check if a new topical category section should be rendered
                    if (!item.getCategory().equals(currentCategory)) {
                        currentCategory = item.getCategory();
            %>
                        <!-- Category Subheading Header Row -->
                        <tr class="category-header">
                            <td colspan="3"><%= currentCategory %></td>
                        </tr>
            <%
                    }
            %>
                    <!-- Record Row: All HTML tags exist outside scriptlet blocks -->
                    <tr class="data-row">
                        <td class="field-name"><%= item.getName() %></td>
                        <td class="field-role"><%= item.getRole() %></td>
                        <td class="field-desc"><%= item.getDescription() %></td>
                    </tr>
            <%
                } // End of for loop
            %>
        </tbody>
    </table>
</div>

</body>
</html>