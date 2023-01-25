<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Get Student Details</title>
<link href="/js/bootstrap-3.4.1-dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
.table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	margin: 0 auto;
	width: 98%;
}

td {
	background-color: #cccddf;
	border: 1px solid white;
	text-align: center;
	padding: 8px;
	color: brown;
}

td {
	color: blueviolet;
}

tr:nth-child(odd) {
	background-color: white;
}

.tableFixHead {
	overflow: auto;
	height: 200px;
}

.tableFixHead thead th {
	position: sticky;
	top: 0;
	z-index: 1;
}

.inputDelete {
	border: none;
	padding-right: 30px;
}

th {
	background: thistle;
	border: 1px solid white;
	text-align: center;
	padding: 8px;
	color: brown;
}
</style>
</head>
<body>
	<%
	LinkedHashMap status = request.getAttribute("status") != null ? (LinkedHashMap) request.getAttribute("status") : null;
	LinkedHashMap deleteStatus = request.getAttribute("deleteStatus") != null ? (LinkedHashMap) request.getAttribute("deleteStatus") : null;
	if(status != null){
		if((int)status.get("id")==0){
			%>
			<div class="p-3 mb-2 bg-success text-white" id="box" style="text-align: center;color: green;font-size: 20px;width: 50%;margin-left:25%;">UPDATED SUCCESSFULLY<svg xmlns="http://www.w3.org/2000/svg" onclick="hide()" style="float: right;margin-right: 10px;margin-top: 7px; cursor: pointer;" width="16" height="16" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
</svg></div></div>
			<%
			status = null;
		}else{
	if ((boolean)status.get("status")) {
	%>
	<div class="p-3 mb-2 bg-success text-white" id="box" style="text-align: center;color: green;font-size: 20px;width: 50%;margin-left:25%;">ADDED SUCCESSFULLY WITH ID : <%=  status.get("id")%><svg xmlns="http://www.w3.org/2000/svg" onclick="hide()" style="float: right;margin-right: 10px;margin-top: 7px; cursor: pointer;" width="16" height="16" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
</svg></div></div>
<%
status = null;
}else{
%>
<div class="p-2 mb-1 bg-warning text-white" id="box" style="text-align: center;font-size: 20px;width: 50%;margin-left:25%;color: #712cf9;">STUDENT DETAILS ALREADY AVAILABLE IN ID : <%=  status.get("id")%><svg xmlns="http://www.w3.org/2000/svg" onclick="hide()" style="float: right;margin-right: 10px;margin-top: 7px; cursor: pointer;" width="16" height="16" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
</svg></div>
<% status = null;}
}
	}
	if(deleteStatus != null){
		
		if((boolean)deleteStatus.get("deleteStatus")){
		%>	
		<div onclick="close()" class="p-3 mb-2 bg-info text-white" id="box" style="text-align: center;font-size: 20px;color: red;width: 50%;margin-left:25%;">DELETED SUCCESSFULLY OF ID : <%=  deleteStatus.get("deleteID")%><svg xmlns="http://www.w3.org/2000/svg" onclick="hide()" style="float: right;margin-right: 10px;margin-top: 7px; cursor: pointer;" width="16" height="16" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
</svg></div></div>
		<%deleteStatus = null;}
	}
%>
	
	<h2 style="text-align: center; color: orange;">STUDENT DETAILS</h2>
	<button onclick="location.href='/addStudent'"
		class="btn btn-success btn-block"
		style="width: 98%; margin: 0 auto; margin-bottom: 5px;">Add</button>
	<div class="tableFixHead">
		<table class="table">
			<thead class="tableRow">
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Age</th>
					<th>Phone</th>
					<th>Email</th>
					<th>Department</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				ArrayList obj = (ArrayList) request.getAttribute("obj");
				JSONArray jsArray = new JSONArray(obj);
				for (int i = 0; i < jsArray.length(); i++) {
					JSONObject object = jsArray.getJSONObject(i);
				%>
				<tr>
					<td><%=object.getInt("id")%></td>
					<td><%=object.getString("name")%></td>
					<td><%=object.getInt("age")%></td>
					<td><%=object.getLong("mobileNo")%></td>
					<td><%=object.getString("email")%></td>
					<td><%=object.get("department")%></td>
					<td><form method="get"
							action='/updateStudent/<%=object.getInt("id")%>'>
							<input type="submit" name="updateId"
								value='update id :<%=object.getInt("id")%>'
								class="inputDelete btn btn-info btn-sm"> <span
								class="glyphicon glyphicon-pencil btn-info"
								style="margin-left: -20px;"></span>
						</form>
						<form method="get"
							action='/deleteStudent/<%=object.getInt("id")%>'
							style="padding-top: 5px;"
							onsubmit='return confirm_entry(<%=object.getInt("id")%>)'>
							<input type="submit" name="deleteId" id="delete"
								value='delete id :<%=object.getInt("id")%>'
								class="inputDelete btn btn-danger btn-sm"><span
								class="glyphicon glyphicon-remove btn-danger"
								style="margin-left: -20px;"></span>
						</form></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<hr>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"
		type="text/javascript"></script>
	<script src="/js/bootstrap-3.4.1-dist/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		function confirm_entry(id) {
			return window
					.confirm("Are you sure!! do you want to delete this id : "
							+ id);
		}
		setTimeout(() => {
			  const box = document.getElementById('box');
			  box.style.display = 'none';
			  box.style.visibility = 'hidden';
			  window.location.href='/';
			}, 5000)
		function hide(){
			const box = document.getElementById('box');
			  box.style.display = 'none';
			  box.style.visibility = 'hidden';
		}
	</script>
</body>
</html>