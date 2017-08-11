<%--
  Created by IntelliJ IDEA.
  User: win7x64
  Date: 2017/8/10
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/background.css" type="text/css"/>
</head>
<body>
<jsp:include page="gadget/headerTool.jsp"></jsp:include>

<table align='center' border='1' cellspacing='0'>
    <tr>
        <th>Title</th>
        <th>Content</th>
    </tr>
    <c:forEach items="${tags}" var="tag" varStatus="st">
        <tr>
            <td>${tag.title}</td>
            <td>${tag.content}</td>
        </tr>
    </c:forEach>
</table>

<form action="/addtag.action" method="post">
    title<br/>
    <input type="text" name="title" style="width: 80%;"/><br/>
    <textarea name="content" style="height: 100px;width: 80%;"></textarea><br/>
    <input type="submit" name="" id="submit">
</form>

</body>
</html>
