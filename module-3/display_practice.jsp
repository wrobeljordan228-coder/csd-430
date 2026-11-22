<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.list" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="com.csd430.model.InceptionRecordPractice" %>

<%--
File description
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
			box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.08);
			border: 1px solid #e0e4e8;
		}
		
		h1{
			color: #1e3a8a;
			margin-top: 0;
			font-size: 1.8rem;
			border-bottom: 2px solid #e2e8f0;
			padding-bottom: 2px;
		}
		/* data description styling */
		.overall-description {
			color: #475569;
			font-size: 0.95rem;
			line-height: 1.6;
			margin-bottom: 20px;
		}
		.meta-panel{
			background-color: #f8fafc;
			border-left: 4px solid #1e3a8a;
			padding: 12px 8px;
			margin-bottom: 25px;
			border-radius: 0 4px 4px 0;
		}
		.meta-panel p{
			margin: 4px 0;
			font-size: 0.9rem;
			color: 334155;
		}
		table.data-table{
			width: 100%;
			border-collapse: callapse;
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
			text-tranform: uppercase;
			letter-spacing: 0.04em;
		}
		tr.groupd-row td {
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

//Java scriplet//

	List<InceptionRecordPractice> recordList = new ArrayList<>();

//record 1//

	InceptionRecordPractice r1 = new InceptionRecordPractice();
	r1.setCategory("Extraction team");
	r1.setName("Dom Cobb");
	r1.setRole("The Extractor");
	r1.setDreamDepth(3);
	r1.setDescription("Corporate theif...");
	recordList.add(r1);
//record 2//
	InceptionRecordPractice r2 = new InceptionRecordPractice();
	r2.setCategory("Extraction Team");
	r2.setName("Arthur");
	r2.setRole("The point man");
	r2.setDreamDepth(2);
	r2.setDescription("Manages missions...");
	recordList.add(r2);
//record 3//
	InceptionRecordPractice r3 = new InceptionRecordPractice();
	r3.setCategory("Extraction team");
	r3.setName("Ariadne");
	r3.setRole("The Architect");
	r3.setDreamDepth(1);
	r3.setDescription("Graduate student..");
	recordList.add(r3);
//record 4//
	InceptionRecordPractice r4 = new InceptionRecordPractice();
	r4.setCategory("Totems & Anchors");
	r4.setName("Spinning Top");
	r4.setRole("Reality test (Cobb)");
	r4.setDreamDepth(0);
	r4.setDescription("Spins indefinitely...");
	recordList.add(r4);
//record 5//
	InceptionRecordPractice r5 = new InceptionRecordPractice();
	r5.setCategory("Totems & Anchors");
	r5.setName("Loaded die");
	r5.setRole("Reality test (Arthur)");
	r5.setDreamDepth(0);
	r5.setDescription("A weighted die...");
	recordList.add(r5);
//server-side timestamp//
	String generationTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm ss"));
%>
<!-- Title and data description -->
	<h1>Inception Mechanics &amp; Asset Catalog</h1>
	<p class = "overall-description">
	<strong>Overall Data Description</strong>This report describes...<em>Inception</em>Data is stored inside<code>InceptionRecordPractice</code>
	JavaBeans implementing<code>java.io.serializable</code>Each record describes...</p>
	
<!-- Record & Descriptive Panel -->
	<div class="meta-panel">
	<p><strong>Record source:</strong>Encapsulated<code>com.csd430.model.InceptionRecordPractice</code>JavaBean instances</p>
	<p><strong>Server Generation Timestamp:</strong> <%= generationTime %></p>
	</div>
<!-- HTML table outside of scriptlets -->
	<table class="data-table">
		<thead>
			<tr>
				<th style="width 20%;">
					Entity name
					<span class="field-subtext">Field: role</span>
				</th>
				<th style="width 18%";>
					Mission Role
					<span class="field
	</table>

</div>

</body>
</html>