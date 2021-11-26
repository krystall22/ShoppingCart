<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<jsp:include page="_header.jsp" />

	<jsp:include page="_menu.jsp" />

	<div class="page-title">Login (For Employee, Manager)</div>

	<div class="Login-container">
		<h3>Enter username and password</h3>
		<br>
		<c:if test="${param.error == 'true'}">
			<div style="color: red; margin: 10px 0px;">

				Login Failed!!!<br /> Reason:
				${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
			</div>
		</c:if>

		<form method="POST" action="${contextPath}/j_spring_security_check">
			<table>
				<tr>
					<td>User Name *</td>
					<td><input name="username" /></td>
				</tr>

				<tr>
					<td>Password *</td>
					<td><input type="password" name="password" /></td>
				</tr>

				<tr>
					<td>&nbsp;</td>
					<td><input type="submit" value="Login" /> <input type="reset"
						value="Reset" /></td>
				</tr>

			</table>
		</form>
		<span class="error-message">${error}</span>
	</div>

	<jsp:include page="_footer.jsp" />
</body>
</html>