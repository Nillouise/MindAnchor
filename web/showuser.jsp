<%--
  Created by IntelliJ IDEA.
  User: win7x64
  Date: 2017/7/22
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/background.css" type="text/css"/>
</head>
<body>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table align='center' border='1' cellspacing='0'>
    <tr>
        <td>username</td>
        <td>CreateTime</td>
    </tr>
    <c:forEach items="${users}" var="user" varStatus="st">
        <tr>
            <td>${user.username}</td>
            <td>${user.createtime}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
