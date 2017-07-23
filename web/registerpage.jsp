<%--
  Created by IntelliJ IDEA.
  User: win7x64
  Date: 2017/7/23
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>利用数据绑定实现登录</title>
</head>
<body>
<form:form commandName="userinfo" action="register.action" method="post">
    <fieldset>
        <legend>注册</legend>
        <p>
            <label for="username">用户名: </label>
            <form:input id="username" path="username"/>
        </p>
        <p>
            <label for="password">密码: </label>
            <form:input id="password" path="password"/>
        </p>
        <p id="buttons">
            <input id="reset" type="reset" >
            <input id="submit" type="submit" >
        </p>
    </fieldset>
</form:form>


</body>
</html>
