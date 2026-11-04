<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--
========================================================================================
File Name:        user_form.jsp
Description:      I am presenting a data collection form gathering 
                  inputs for Employment Applications, Restaurant Dining Feedback, 
                  and Annual Purchased Asset Reviews.
Standards:        HTML5, external style conventions, strict scriptlet separation, 
                  a minimum of 5 distinct input fields with multiple input types.
========================================================================================
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Integrated Intake & Review Portal</title>
    <style>
    <%-- Below is the CSS --%>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 30px;
            color: #333;
        }
        .form-container {
            max-width: 720px;
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
        .portal-intro {
            color: #64748b;
            font-size: 0.95rem;
            line-height: 1.5;
            margin-bottom: 25px;
        }
        fieldset {
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            padding: 18px 22px;
            margin-bottom: 24px;
            background-color: #fafbfc;
        }
        legend {
            font-weight: bold;
            color: #1e3a8a;
            padding: 0 8px;
            font-size: 1.05rem;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            font-size: 0.9rem;
            color: #1f2937;
        }
        input[type="text"],
        input[type="email"],
        input[type="number"],
        input[type="date"],
        select,
        textarea {
            width: 100%;
            padding: 9px 10px;
            border: 1px solid #cbd5e1;
            border-radius: 4px;
            font-size: 0.92rem;
            box-sizing: border-box;
            background-color: #ffffff;
        }
        input:focus, select:focus, textarea:focus {
            outline: none;
            border-color: #2563eb;
        }
        .radio-group {
            display: flex;
            gap: 20px;
            margin-top: 5px;
        }
        .inline-label {
            font-weight: normal;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            cursor: pointer;
        }
        .btn-submit {
            background-color: #1e3a8a;
            color: #ffffff;
            border: none;
            padding: 12px 24px;
            border-radius: 4px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
        }
        .btn-submit:hover {
            background-color: #1d4ed8;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h1>Integrated Intake &amp; Feedback Portal</h1>
    <p class="portal-intro">
        Please enter the required information across the three domains below. 
        All records will be validated server-side and synthesized into a structured summary report.
    </p>

    <!-- Submits form payloads to the processing JSP via HTTP POST -->
    <form action="process_form.jsp" method="post">

        <!-- Domain 1: Job Application Record (Fields 1-4) -->
        <fieldset>
            <legend>1. Employment Application</legend>
            <div class="form-group">
                <label for="applicantName">Applicant Full Name:</label>
                <input type="text" id="applicantName" name="applicantName" required>
            </div>
            <div class="form-group">
                <label for="applicantEmail">Email Address:</label>
                <input type="email" id="applicantEmail" name="applicantEmail" required>
            </div>
            <div class="form-group">
                <label for="targetPosition">Target Position:</label>
                <select id="targetPosition" name="targetPosition" required>
                    <option value="">-- Select Position --</option>
                    <option value="Junior Java Developer">Junior Java Developer</option>
                    <option value="Backend Software Engineer">Backend Software Engineer</option>
                    <option value="Database Application Specialist">Database Application Specialist</option>
                </select>
            </div>
            <div class="form-group">
                <label for="yearsExperience">Years of Experience:</label>
                <input type="number" id="yearsExperience" name="yearsExperience" min="0" max="45" required>
            </div>
        </fieldset>

        <!-- Domain 2: Restaurant Dining Feedback (Fields 5-8) -->
        <fieldset>
            <legend>2. Restaurant Experience &amp; Service Feedback</legend>
            <div class="form-group">
                <label for="restaurantName">Restaurant Name:</label>
                <input type="text" id="restaurantName" name="restaurantName" required>
            </div>
            <div class="form-group">
                <label for="visitDate">Date of Visit:</label>
                <input type="date" id="visitDate" name="visitDate" required>
            </div>
            <div class="form-group">
                <label>Overall Dining Rating:</label>
                <div class="radio-group">
                    <label class="inline-label"><input type="radio" name="diningRating" value="5 - Excellent" checked> 5 (Excellent)</label>
                    <label class="inline-label"><input type="radio" name="diningRating" value="4 - Good"> 4 (Good)</label>
                    <label class="inline-label"><input type="radio" name="diningRating" value="3 - Average"> 3 (Average)</label>
                    <label class="inline-label"><input type="radio" name="diningRating" value="2 - Fair"> 2 (Fair)</label>
                    <label class="inline-label"><input type="radio" name="diningRating" value="1 - Poor"> 1 (Poor)</label>
                </div>
            </div>
            <div class="form-group">
                <label for="diningComments">Meal &amp; Service Feedback Notes:</label>
                <textarea id="diningComments" name="diningComments" rows="3" placeholder="Food quality, server attentiveness, atmosphere..."></textarea>
            </div>
        </fieldset>

        <!-- Domain 3: Yearly Review of Purchased Item (Fields 9-13) -->
        <fieldset>
            <legend>3. Annual Purchased Asset Review</legend>
            <div class="form-group">
                <label for="itemCategory">Asset Type:</label>
                <select id="itemCategory" name="itemCategory" required>
                    <option value="">-- Select Category --</option>
                    <option value="Automobile / Vehicle">Automobile / Vehicle</option>
                    <option value="Home / Residential Property">Home / Residential Property</option>
                    <option value="Major Appliance">Major Appliance</option>
                    <option value="Personal Computing Hardware">Personal Computing Hardware</option>
                </select>
            </div>
            <div class="form-group">
                <label for="itemName">Item Make / Model / Description:</label>
                <input type="text" id="itemName" name="itemName" placeholder="e.g., 2022 Honda Civic or Central A/C Unit" required>
            </div>
            <div class="form-group">
                <label for="ownershipYears">Years Owned:</label>
                <input type="number" id="ownershipYears" name="ownershipYears" min="1" max="50" required>
            </div>
            <div class="form-group">
                <label>Reliability / Maintenance Assessment:</label>
                <div class="radio-group">
                    <label class="inline-label"><input type="radio" name="itemCondition" value="Exceeded Expectations" checked> Exceeded Expectations</label>
                    <label class="inline-label"><input type="radio" name="itemCondition" value="Normal Wear &amp; Tear"> Normal Wear</label>
                    <label class="inline-label"><input type="radio" name="itemCondition" value="Frequent Repairs Required"> Frequent Repairs</label>
                </div>
            </div>
            <div class="form-group">
                <label for="reviewNotes">Annual Summary &amp; Recommendation:</label>
                <textarea id="reviewNotes" name="reviewNotes" rows="3" placeholder="Long-term durability, ongoing costs, would you buy again?"></textarea>
            </div>
        </fieldset>

        <button type="submit" class="btn-submit">Submit Complete Intake Record</button>
    </form>
</div>

</body>
</html>