<%--
  Created by IntelliJ IDEA.
  User: win7x64
  Date: 2017/8/10
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="gadget/headerTool.jsp"></jsp:include>
<form action="/addtag.action" method="post">
    title<br/>
    <input type="text" name="title" style="width: 80%;"/><br/>
    <input type="text" name="content" style="height: 100px;width: 80%;"><br/>
    <input type="submit" name="" id="submit">
</form>

</body>
</html>
