<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update User:</title>
</head>
<body>

<form action="/admin/updateUser" method="post">
    <input type="hidden" name="id" value="${user.getId()}"/>
    <table>
        <tr>
            <td>Id:</td>
            <td>${user.getId()}</td>
        </tr>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="name" value="${user.getName()}"/></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input type="text" name="password" value="${user.getPassword()}"/></td>
        </tr>
        <tr>
            <td>Age:</td>
            <td><input type="number" name="age" value="${user.getAge()}"/></td>
        </tr>
        <tr>
            <td>Role:</td>
            <c:forEach items="${roleList}" var="role">
                <td>
                    <input type="checkbox" name="roles" value="${role.role}"/>${role.role}
                </td>
            </c:forEach>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Update"/></td>
        </tr>
    </table>
</form>

</body>
</html>