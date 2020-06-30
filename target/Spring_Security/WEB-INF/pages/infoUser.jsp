<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Title</title>
</head>
<body>
<h2>User Info:</h2>
<table>
    <tr>
        <td>Id</td>
        <td><sec:authentication property="principal.id"/></td>
    </tr>
    <tr>
        <td>Name</td>
        <td><sec:authentication property="principal.name"/></td>
    </tr>
    <tr>
        <td>Password</td>
        <td><sec:authentication property="principal.password"/></td>
    </tr>
    <tr>
        <td>Age</td>
        <td><sec:authentication property="principal.age"/></td>
    </tr>
    <tr>
        <td>Roles:</td>
        <td><sec:authentication property="principal.authorities" var="auth" />
        <c:forEach var="item" items="${auth}">
            <c:out value="${item.role}"/>
        </c:forEach>
        </td>
    </tr>
</table>
</body>

<form action="/logout" method="get">
    <input type="submit" value="Logout"/>
</form>
</html>
