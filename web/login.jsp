<%--
  Created by IntelliJ IDEA.
  User: win7x64
  Date: 2017/7/21
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="css/background.css" type="text/css"/>
</head>
<body>
<div>
    <%
        Boolean tryLoginFail = (Boolean)session.getAttribute("tryLoginFail");
        if(tryLoginFail==null){tryLoginFail=false;}
        if(tryLoginFail==true)
        {
            response.getWriter().println("<h>login fail</h>");
        }

    %>
<form action="login.action" method="post">
    <fieldset>
        <legend>登录</legend>
        <p>
            <label for="username">UserName: </label>
            <input type="text" id="username" name="username"
                   tabindex="1">
        </p>
        <p>
            <label for="password">Password: </label>
            <input type="password" id="password"
                   name="password" tabindex="2">
        </p>
        <p id="buttons">
            <input id="reset" type="reset" tabindex="3">
            <input id="submit" type="submit" tabindex="4">
        </p>
    </fieldset>
</form>
</div>
</body>
</html>
