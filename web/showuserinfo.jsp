<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%--
handnote
这个页面用数据绑定技术和标签，让spring框架利用request的数据生成一个userinfo对象再传给controller
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
    <input type="submit" value="submit"/>
</fieldset>
</form:form>
</body>
</html>
