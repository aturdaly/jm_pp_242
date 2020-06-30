<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Users</title>
</head>
<body>

<h2>Users List:</h2>
<table border="1">
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Age</td>
        <td>Role</td>
    </tr>

    <c:forEach items="${userList}" var="user">

        <tr>
            <td>${user.getId()}</td>
            <td>${user.getName()}</td>
            <td>${user.getAge()}</td>
            <td>
                <c:forEach items="${user.getRoles()}" var="userRoles">
                    ${userRoles.getRole()}
                </c:forEach>
            </td>

            <td>
                <a href="/admin/deleteUser?id=${user.getId()}" methods="get">
                    <input type="submit" name="id" value="Delete" style="float:left">
                </a>
                <a href="/admin/updateUser?id=${user.getId()}" methods="get">
                    <input type="submit" name="id" value="Update" style="float:left">
                </a>
            </td>
        </tr>

    </c:forEach>
</table>

<br/><br/>
<div>
    Input New User:
</div>

<form action="/admin/addUser" method="post">
    <table style="width: 25%">
        <tr>
            <td>Name</td>
            <td><input type="text" name="name"/></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="text" name="password"/></td>
        </tr>
        <tr>
            <td>Age</td>
            <td><input type="number" name="age"/></td>
        </tr>
        <tr>
            <td>Role</td>
            <c:forEach items="${roleList}" var="role">
                <td>
                    <input type="checkbox" name="roles" value="${role.role}"/>${role.role}
                </td>
            </c:forEach>
        </tr>
    </table>
    <input type="submit" value="Add"/>
</form>

<form action="/logout" method="get">
    <input type="submit" value="Logout"/>
</form>
</body>
</html>