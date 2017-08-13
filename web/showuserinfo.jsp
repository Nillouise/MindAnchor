<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%--
  Created by IntelliJ IDEA.
  User: win7x64
  Date: 2017/8/13
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>userinfo</title>
</head>
<body>
<form:form commandName="userinfo" action="changeuserinfo.action" method="post">
<fieldset>
    <legend>UserInfo</legend>
    <p>
        <label for="username">username: </label>
        <form:input id="username" path="username"/>
    </p>
    <p>
        <label for="password">password: </label>
        <form:input id="password" path="password"/>
    </p>
</fieldset>
</form:form>
</body>
</html>
