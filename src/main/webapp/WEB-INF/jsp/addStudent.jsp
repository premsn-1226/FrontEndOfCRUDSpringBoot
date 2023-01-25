<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Student</title>
<link href="/js/bootstrap-3.4.1-dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.inputAdd {
	width: 100% !important;
}

.buttonAddSubmit {
	width: 15% !important;
	padding: 10px !important;
}

.buttonAdd {
	margin-top: 30px !important;
}

.center {
	width: 90%;
}
</style>
</head>
<body>
	<%@ include file="home.jsp"%>
	<br>
	<div class="container-fluid center">

		<div class="panel panel-primary">
			<div class="panel-heading formHeading">
				<center>
					<h2 class="panel-title">ADD STUDENT</h2>
				</center>
			</div>
			<div class="panel-body form">
				<form class="form-horizontal" method="post" action="/">
					<div class="form-group">
						<div class="col-lg-6 col-sm-12 col-md-12">
							<div class="col-sm-12 col-lg-2">
								<label for="inputEmail3" class="control-label">NAME : </label>
							</div>

							<div class="col-sm-12 col-lg-10">
								<input name="name" value="" type="text" required="required" class="inputAdd"
									style="border-radius: 5px; padding: 5px; padding-right: 20px;">
							</div>
						</div>
						<div class="col-lg-6 col-sm-12 col-md-12">
							<div class="col-sm-12 col-lg-3">
								<label for="inputEmail3" class="control-label">EMAIL-ID
									: </label>
							</div>

							<div class="col-sm-12 col-lg-9">
								<input name="email" value="" type="text" required="required" class="inputAdd"
									style="border-radius: 5px; padding: 5px;">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-4 col-sm-12 col-md-12">
							<div class="col-sm-12 col-lg-5">
								<label for="inputEmail3" class="control-label">DEPARTMENT : </label>
							</div>

							<div class="col-sm-12 col-lg-7">
								<input name="department" type="text" value="" required="required" class="inputAdd"
									style="border-radius: 5px; padding: 5px;">
							</div>
						</div>
						<div class="col-lg-3 col-sm-12 col-md-12">
							<div class="col-sm-12 col-lg-4">
								<label for="inputEmail3" class="control-label">AGE : </label>
							</div>

							<div class="col-sm-12 col-lg-8">
								<input name="age" type="text" value="" required="required" class="inputAdd"
									style="border-radius: 5px; padding: 5px;">
							</div>
						</div>
						<div class="col-lg-5 col-sm-12 col-md-12">
							<div class="col-sm-12 col-lg-5">
								<label for="inputEmail3" class="control-label">MOBILE
									NUMBER : </label>
							</div>

							<div class="col-sm-12 col-lg-7">
								<input name="phone" type="text" value="" required="required" class="inputAdd"
									style="border-radius: 5px; padding: 5px;">
							</div>
						</div>
					</div>
					<div class="buttonAdd">
						<center>
							<input type="submit" value="ADD" name="add"
								class="buttonAddSubmit btn btn-md btn-success">
							<button onclick="location.href='/'"
								class="buttonAddSubmit btn btn-md btn-danger">CANCEL</button>
						</center>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/js/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</body>
</html>