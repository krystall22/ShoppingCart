<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="name" value="${pageContext.request.userPrincipal.name}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style type="text/css">
<%@include file="css/styles.css" %> 
</style>
</head>
<body>
	<div class="header-container">
		<div class="site-name">Online Shop</div>
		<div class="header-bar">
			<c:if test="${name != null}">
                Hello <a href="${contextPath}/accountInfo">${name}</a>
				&nbsp;|&nbsp;
          <a href="${contextPath}/logout">Logout</a>
			</c:if>
			<c:if test="${name == null }">
				<a href="${contextPath}/login">Login</a>
			</c:if>
		</div>
	</div>
</body>
</html>