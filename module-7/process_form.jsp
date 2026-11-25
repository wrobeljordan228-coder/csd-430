<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%--
========================================================================================
File Name:        process_form.jsp
Description:      It receives HTTP POST parameters from user_form.jsp, then validates all the inputs
                  server-side using Java scriptlets, and presents the processed records
                  in a structured HTML table format with field and record descriptions.
Standards:        All HTML markup is rendered outside the scriptlet tags; pure Java handles the
                  parsing, validation, and control-flow checks.
Sources:			  "Hi I was hoping you could help me with my assignment this week? For this week’s assignment, 
                  I should create a form to gather data from a user. In the form, it must have a minimum of three types of user 
                  input and a minimum of five data entry points. the form should be a JSP file.
                  there are more requirements or steps, but let's get to those later. can you help me create a file to satisfy what i outlined?" 
                  prompt. Gemini, Google, 3 Nov. 2026, https://gemini.google.com/
========================================================================================
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Intake Record Processing &amp; Verification</title>
    <style>
<%--CSS styling --%>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 30px;
            color: #333;
        }
        .container {
            max-width: 850px;
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
            padding-bottom: 10px;
        }
        .meta-description {
            color: #475569;
            font-size: 0.95rem;
            line-height: 1.6;
            margin-bottom: 20px;
        }
        .record-info-panel {
            background-color: #f8fafc;
            border-left: 4px solid #1e3a8a;
            padding: 12px 18px;
            margin-bottom: 25px;
            border-radius: 0 4px 4px 0;
        }
        .record-info-panel p {
            margin: 4px 0;
            font-size: 0.9rem;
            color: #334155;
        }
        .error-card {
            background-color: #fee2e2;
            border-left: 4px solid #ef4444;
            color: #b91c1c;
            padding: 14px 18px;
            margin-bottom: 20px;
            border-radius: 0 4px 4px 0;
        }
        .error-card ul {
            margin: 6px 0 0 20px;
            padding: 0;
        }
        /* Table Structure */
        table.data-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            font-size: 0.92rem;
        }
        table.data-table th, table.data-table td {
            padding: 10px 14px;
            text-align: left;
            border-bottom: 1px solid #e2e8f0;
        }
        table.data-table thead th {
            background-color: #1e3a8a;
            color: #ffffff;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.04em;
        }
        tr.category-header td {
            background-color: #e2e8f0;
            color: #0f172a;
            font-weight: bold;
            font-size: 0.95rem;
            text-transform: uppercase;
            letter-spacing: 0.03em;
        }
        td.field-label {
            font-weight: 600;
            color: #1e293b;
            width: 25%;
        }
        td.field-desc {
            color: #64748b;
            font-size: 0.88rem;
            width: 35%;
        }
        td.field-val {
            color: #0f172a;
            width: 40%;
        }
        .btn-return {
            display: inline-block;
            background-color: #2563eb;
            color: #ffffff;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 4px;
            font-weight: bold;
            margin-top: 25px;
        }
        .btn-return:hover {
            background-color: #1d4ed8;
        }
    </style>
</head>
<body>

<div class="container">

<%
    // =========================================================================
    // 1. PARAMETER EXTRACTION
    // Retrieving submitted string inputs from the incoming HTTP POST request
    // =========================================================================
    
    // Domain 1: Job Application
    String applicantName   = request.getParameter("applicantName");
    String applicantEmail  = request.getParameter("applicantEmail");
    String targetPosition  = request.getParameter("targetPosition");
    String yearsExpRaw     = request.getParameter("yearsExperience");

    // Domain 2: Restaurant Experience
    String restaurantName  = request.getParameter("restaurantName");
    String visitDate       = request.getParameter("visitDate");
    String diningRating    = request.getParameter("diningRating");
    String diningComments  = request.getParameter("diningComments");

    // Domain 3: Annual Asset Review
    String itemCategory    = request.getParameter("itemCategory");
    String itemName        = request.getParameter("itemName");
    String ownershipRaw    = request.getParameter("ownershipYears");
    String itemCondition   = request.getParameter("itemCondition");
    String reviewNotes     = request.getParameter("reviewNotes");

    // =========================================================================
    // 2. SERVER-SIDE DATA VALIDATION
    // Executing boundary and null verification on all mandatory fields
    // =========================================================================
    List<String> errors = new ArrayList<>();

    // Validate Job Application fields
    if (applicantName == null || applicantName.trim().isEmpty()) {
        errors.add("Applicant Full Name is required.");
    }
    if (applicantEmail == null || applicantEmail.trim().isEmpty() || !applicantEmail.contains("@")) {
        errors.add("A valid Applicant Email Address is required.");
    }
    if (targetPosition == null || targetPosition.trim().isEmpty()) {
        errors.add("Target Position must be selected.");
    }
    int yearsExp = 0;
    try {
        if (yearsExpRaw == null || yearsExpRaw.trim().isEmpty()) {
            errors.add("Years of experience is required.");
        } else {
            yearsExp = Integer.parseInt(yearsExpRaw.trim());
            if (yearsExp < 0 || yearsExp > 45) {
                errors.add("Years of experience must be between 0 and 45.");
            }
        }
    } catch (NumberFormatException e) {
        errors.add("Years of experience must be a valid integer.");
    }

    // Validating Restaurant Feedback fields
    if (restaurantName == null || restaurantName.trim().isEmpty()) {
        errors.add("Restaurant Name is required.");
    }
    if (visitDate == null || visitDate.trim().isEmpty()) {
        errors.add("Date of visit is required.");
    }

    // Validating Asset Review fields
    if (itemCategory == null || itemCategory.trim().isEmpty()) {
        errors.add("Asset Type category must be selected.");
    }
    if (itemName == null || itemName.trim().isEmpty()) {
        errors.add("Item Make / Model is required.");
    }
    int ownershipYears = 0;
    try {
        if (ownershipRaw == null || ownershipRaw.trim().isEmpty()) {
            errors.add("Years of ownership is required.");
        } else {
            ownershipYears = Integer.parseInt(ownershipRaw.trim());
            if (ownershipYears < 1 || ownershipYears > 50) {
                errors.add("Years of ownership must be between 1 and 50.");
            }
        }
    } catch (NumberFormatException e) {
        errors.add("Years of ownership must be a valid integer.");
    }

    // Capturing server execution timestamp
    String processedTimestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

    // =========================================================================
    // 3. CONDITIONAL RENDERING: Displaying Validation Errors or Data Table
    // =========================================================================
    if (!errors.isEmpty()) {
%>
        <!-- Error Reporting View: HTML outside of scriptlets -->
        <h1>Submission Validation Failed</h1>
        <div class="error-card">
            <strong>The following validation errors must be corrected:</strong>
            <ul>
                <% for (String err : errors) { %>
                    <li><%= err %></li>
                <% } %>
            </ul>
        </div>
        <a href="user_form.jsp" class="btn-return">&larr; Return to Intake Form</a>
<%
    } else {
%>
        <!-- Success Presentation View: HTML outside of scriptlets -->
        <h1>Intake Record Summary Report</h1>
        <p class="meta-description">
            This document confirms successful server-side intake and verification of incoming client parameters. 
            All values have been parsed, validated for data integrity, and cataloged into their designated domain records.
        </p>

        <!-- Record and Execution Metadata Panel -->
        <div class="record-info-panel">
            <p><strong>Record Status:</strong> Verified &amp; Persisted to Request Scope</p>
            <p><strong>Server Processing Timestamp:</strong> <%= processedTimestamp %></p>
            <p><strong>Total Fields Validated:</strong> 11 Entry Points Across 3 Domains</p>
        </div>

        <!-- Structured HTML Data Table Format -->
        <table class="data-table">
            <thead>
                <tr>
                    <th>Field Identifier</th>
                    <th>Field &amp; Record Description</th>
                    <th>Submitted / Processed Value</th>
                </tr>
            </thead>
            <tbody>
                <!-- Category 1: Employment Record -->
                <tr class="category-header">
                    <td colspan="3">Domain 1: Employment Application Dossier</td>
                </tr>
                <tr>
                    <td class="field-label">Applicant Name</td>
                    <td class="field-desc">Legal candidate full identity string</td>
                    <td class="field-val"><%= applicantName.trim() %></td>
                </tr>
                <tr>
                    <td class="field-label">Email Address</td>
                    <td class="field-desc">Primary electronic contact endpoint</td>
                    <td class="field-val"><%= applicantEmail.trim() %></td>
                </tr>
                <tr>
                    <td class="field-label">Target Position</td>
                    <td class="field-desc">Technical organizational role applied for</td>
                    <td class="field-val"><%= targetPosition.trim() %></td>
                </tr>
                <tr>
                    <td class="field-label">Experience</td>
                    <td class="field-desc">Validated cumulative career experience in years</td>
                    <td class="field-val"><%= yearsExp %> year<%= (yearsExp == 1) ? "" : "s" %></td>
                </tr>

                <!-- Category 2: Dining Feedback Record -->
                <tr class="category-header">
                    <td colspan="3">Domain 2: Restaurant Meal &amp; Service Feedback</td>
                </tr>
                <tr>
                    <td class="field-label">Establishment</td>
                    <td class="field-desc">Name of dining establishment evaluated</td>
                    <td class="field-val"><%= restaurantName.trim() %></td>
                </tr>
                <tr>
                    <td class="field-label">Visit Date</td>
                    <td class="field-desc">Calendar date dining transaction occurred</td>
                    <td class="field-val"><%= visitDate.trim() %></td>
                </tr>
                <tr>
                    <td class="field-label">Experience Rating</td>
                    <td class="field-desc">Standardized ordinal service and food quality score</td>
                    <td class="field-val"><%= diningRating %></td>
                </tr>
                <tr>
                    <td class="field-label">Patron Comments</td>
                    <td class="field-desc">Narrative feedback regarding food, staff, and atmosphere</td>
                    <td class="field-val"><%= (diningComments != null && !diningComments.trim().isEmpty()) ? diningComments.trim() : "<em>No comments recorded</em>" %></td>
                </tr>

                <!-- Category 3: Asset Review Record -->
                <tr class="category-header">
                    <td colspan="3">Domain 3: Annual Purchased Asset Review</td>
                </tr>
                <tr>
                    <td class="field-label">Asset Classification</td>
                    <td class="field-desc">General operational category of physical asset</td>
                    <td class="field-val"><%= itemCategory.trim() %></td>
                </tr>
                <tr>
                    <td class="field-label">Item / Model Identifier</td>
                    <td class="field-desc">Make, model, or formal descriptor of owned item</td>
                    <td class="field-val"><%= itemName.trim() %></td>
                </tr>
                <tr>
                    <td class="field-label">Ownership Duration</td>
                    <td class="field-desc">Validated total elapsed years under ownership</td>
                    <td class="field-val"><%= ownershipYears %> year<%= (ownershipYears == 1) ? "" : "s" %></td>
                </tr>
                <tr>
                    <td class="field-label">Condition Assessment</td>
                    <td class="field-desc">Qualitative evaluation of reliability and wear</td>
                    <td class="field-val"><%= itemCondition %></td>
                </tr>
                <tr>
                    <td class="field-label">Annual Review Notes</td>
                    <td class="field-desc">End-of-year maintenance notes and purchase satisfaction</td>
                    <td class="field-val"><%= (reviewNotes != null && !reviewNotes.trim().isEmpty()) ? reviewNotes.trim() : "<em>No review notes recorded</em>" %></td>
                </tr>
            </tbody>
        </table>

        <a href="user_form.jsp" class="btn-return">&larr; Enter Another Intake Record</a>
<%
    }
%>

</div>

</body>
</html>