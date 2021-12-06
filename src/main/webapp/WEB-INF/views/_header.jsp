<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="name" value="${pageContext.request.userPrincipal.name}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style type="text/css">

</style>
</head>
<body>
	<header class="header_section" style="background-color: #00B2EE;">
		<div class="container-fluid">
			<nav class="navbar navbar-expand-lg custom_nav-container">
				<a class="navbar-brand" href="${contextPath}/"> <span>Online
						Shop</span>
				</a>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<div class="nav-item active" style="color: white;">
						<a class="nav-link" href="${contextPath}/">Home</a> <a
							class="nav-link" href="${contextPath}/productList">Product
							List</a> <a class="nav-link" href="${contextPath}/shoppingCart">My
							Cart</a> 
						<security:authorize
							access="hasAnyRole('ROLE_MANAGER','ROLE_EMPLOYEE')">
							<a class="nav-link" href="${contextPath}/orderList">Order
								List</a>
						</security:authorize>

						<security:authorize access="hasRole('ROLE_MANAGER')">
							<a class="nav-link" href="${contextPath}/product">Create
								Product</a>
						</security:authorize>
					</div>
					<div class="user_option-box" style="padding-bottom: 10px;">
						<c:if test="${name != null}">
						Hello <a href="${contextPath }/accountInfo">${name }</a>
					&nbsp; &nbsp;
					<a href="${contextPath }/logout">Logout</a>
						</c:if>
						<c:if test="${name == null}">
							<a href="${contextPath }/login">Login</a>
						</c:if>
					</div>
				</div>
			</nav>
		</div>
	</header>
</body>
</html>