<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
session.removeAttribute("UserId");
session.removeAttribute("UserName");

session.invalidate();

response.sendRedirect("LoginForm.jsp");
%>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
	</body>
</html>