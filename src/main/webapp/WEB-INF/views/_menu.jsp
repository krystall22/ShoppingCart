<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/styles.css">
</head>
<body>
	<div class="menu-container">

		<a href="${contextPath}/">Home</a> | <a
			href="${contextPath}/productList">Product List</a> | <a
			href="${contextPath}/shoppingCart">My Cart</a> |
		<security:authorize
			access="hasAnyRole('ROLE_MANAGER','ROLE_EMPLOYEE')">
			<a href="${contextPath}/orderList"> Order List</a>
		</security:authorize>

		<security:authorize access="hasAnyRole('ROLE_MANAGER')">
			<a href="${contextPath}/product"> Create Product </a>
		</security:authorize>

	</div>

</body>
</html>