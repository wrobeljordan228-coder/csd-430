<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="com.csd430.model.InceptionRecord" %>
<%--
========================================================================================
File Name:        display_inception.jsp
Description:      Server-side JSP that initializes and reads records from the 
                  InceptionRecord JavaBean and renders them into a structured 
                  HTML table display.
Requirements:     
  - Pure Java scriptlets for data logic (<% ... %>)
  - Zero HTML output generated inside scriptlets (all tags reside externally)
  - HTML table layout with field, record, and overall data descriptions
  - JavaBean implements java.io.Serializable with 5+ fields
========================================================================================
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inception Architecture - JavaBean Data Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 30px;
            color: #333;
        }
        .container {
            max-width: 960px;
            margin: 0 auto;
            background-color: #ffffff;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            border: 1px solid #e0e4e8;
        }
        h1 {
            color: #1e3a8a;
            margin-top: 0;
            font-size: 1.8rem;
            border-bottom: 2px solid #e2e8f0;
            padding-bottom: 12px;
        }
        /* Overall Data Description styling */
        .overall-description {
            color: #475569;
            font-size: 0.95rem;
            line-height: 1.6;
            margin-bottom: 20px;
        }
        /* Record and Metadata Info Panel */
        .meta-panel {
            background-color: #f8fafc;
            border-left: 4px solid #1e3a8a;
            padding: 12px 18px;
            margin-bottom: 25px;
            border-radius: 0 4px 4px 0;
        }
        .meta-panel p {
            margin: 4px 0;
            font-size: 0.9rem;
            color: #334155;
        }
        /* Structured Data Table */
        table.data-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            font-size: 0.9rem;
        }
        table.data-table th, table.data-table td {
            padding: 12px 14px;
            text-align: left;
            border-bottom: 1px solid #e2e8f0;
            vertical-align: top;
        }
        table.data-table thead th {
            background-color: #1e3a8a;
            color: #ffffff;
            font-weight: 600;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.04em;
        }
        tr.group-row td {
            background-color: #e2e8f0;
            color: #0f172a;
            font-weight: bold;
            font-size: 0.92rem;
            text-transform: uppercase;
            letter-spacing: 0.03em;
        }
        .badge {
            display: inline-block;
            padding: 3px 8px;
            border-radius: 4px;
            font-size: 0.8rem;
            font-weight: bold;
            color: #ffffff;
            background-color: #2563eb;
        }
        .field-subtext {
            display: block;
            font-size: 0.78rem;
            color: #64748b;
            margin-top: 2px;
        }
    </style>
</head>
<body>

<div class="container">

<%
    // =========================================================================
    // JAVASCRIPTLET: Data Initialization & JavaBean Population
    // Uses the JavaBean setters to populate 5 distinct fields across records
    // =========================================================================
    List<InceptionRecord> recordList = new ArrayList<>();

    // Record 1: Extraction Team
    InceptionRecord r1 = new InceptionRecord();
    r1.setCategory("Extraction Team");
    r1.setName("Dom Cobb");
    r1.setRole("The Extractor");
    r1.setDreamDepth(3);
    r1.setDescription("Master corporate thief who enters subconscious minds to steal secrets and plant ideas.");
    recordList.add(r1);

    // Record 2: Extraction Team
    InceptionRecord r2 = new InceptionRecord();
    r2.setCategory("Extraction Team");
    r2.setName("Arthur");
    r2.setRole("The Point Man");
    r2.setDreamDepth(2);
    r2.setDescription("Manages mission logistics, detailed intelligence, and operational defense in zero-gravity.");
    recordList.add(r2);

    // Record 3: Extraction Team
    InceptionRecord r3 = new InceptionRecord();
    r3.setCategory("Extraction Team");
    r3.setName("Ariadne");
    r3.setRole("The Architect");
    r3.setDreamDepth(1);
    r3.setDescription("Graduate student who designs dream mazes, structural environments, and impossible physics.");
    recordList.add(r3);

    // Record 4: Totems
    InceptionRecord r4 = new InceptionRecord();
    r4.setCategory("Totems & Anchors");
    r4.setName("Spinning Top");
    r4.setRole("Reality Test (Cobb)");
    r4.setDreamDepth(0);
    r4.setDescription("Spins indefinitely without stopping if in a dream; wobbles and falls over in reality.");
    recordList.add(r4);

    // Record 5: Totems
    InceptionRecord r5 = new InceptionRecord();
    r5.setCategory("Totems & Anchors");
    r5.setName("Loaded Die");
    r5.setRole("Reality Test (Arthur)");
    r5.setDreamDepth(0);
    r5.setDescription("A weighted die with a precise center of gravity known exclusively to Arthur.");
    recordList.add(r5);

    // Server-side timestamp for metadata panel
    String generationTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
%>

    <!-- Title and Overall Data Description -->
    <h1>Inception Subconscious Mechanics &amp; Asset Catalog</h1>
    <p class="overall-description">
        <strong>Overall Data Description:</strong> This report catalogs operational entities from the film 
        <em>Inception</em>. Data is stored within server-side <code>InceptionRecord</code> JavaBeans implementing 
        <code>java.io.Serializable</code>. Each record encapsulates five distinct fields: category grouping, 
        entity title, assigned mission role, target dream layer depth, and narrative context.
    </p>

    <!-- Record Metadata & Descriptive Summary Panel -->
    <div class="meta-panel">
        <p><strong>Record Source:</strong> Encapsulated <code>com.csd430.model.InceptionRecord</code> JavaBean Instances</p>
        <p><strong>Active Fields per Record:</strong> 5 (Category, Name, Role, Subconscious Depth, Description)</p>
        <p><strong>Total Loaded Records:</strong> <%= recordList.size() %></p>
        <p><strong>Server Generation Timestamp:</strong> <%= generationTime %></p>
    </div>

    <!-- Structured HTML Data Table (Strictly outside of scriptlets) -->
    <table class="data-table">
        <thead>
            <tr>
                <th style="width: 20%;">
                    Entity Name
                    <span class="field-subtext">Field: name</span>
                </th>
                <th style="width: 18%;">
                    Mission Role
                    <span class="field-subtext">Field: role</span>
                </th>
                <th style="width: 17%;">
                    Domain Group
                    <span class="field-subtext">Field: category</span>
                </th>
                <th style="width: 12%;">
                    Dream Depth
                    <span class="field-subtext">Field: dreamDepth</span>
                </th>
                <th style="width: 33%;">
                    Context &amp; Narrative Description
                    <span class="field-subtext">Field: description</span>
                </th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Loop through JavaBean collection using pure Java control flow
                for (InceptionRecord item : recordList) { 
            %>
                <tr>
                    <td><strong><%= item.getName() %></strong></td>
                    <td><%= item.getRole() %></td>
                    <td><span class="badge"><%= item.getCategory() %></span></td>
                    <td>Level <%= item.getDreamDepth() %></td>
                    <td><%= item.getDescription() %></td>
                </tr>
            <% 
                } // End Java loop
            %>
        </tbody>
    </table>

</div>

</body>
</html>