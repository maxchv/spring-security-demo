<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Kevin's Auto Service Center</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

    <!-- Latest Jquery -->
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"
            type="text/javascript"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/global.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
    <div class="row">
        <h1>Services</h1>
    </div>
    <form id="appointment-form" method="post" action="<spring:url value="/login"/>">
        <div class="form-group">
            <label for="custom_username">Username</label>
            <input name="custom_username" id="custom_username" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="custom_password">Password</label>
            <input type="password" id="custom_password" name="custom_password" class="form-control"/>
        </div>
        <sec:csrfInput/>
        <c:if test="${param.error != null}">
            <p>Invalid Username or Password</p>
        </c:if>
        <c:if test="${param.logout != null}">
            <p>You have successfully been logged out.</p>
        </c:if>
        <button type="submit" id="btn-save" class="btn btn-primary">Login</button>
    </form>
</div>
</body>
</html>