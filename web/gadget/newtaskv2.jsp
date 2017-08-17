<%--
  Created by IntelliJ IDEA.
  User: win7x64
  Date: 2017/8/18
  Time: 5:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <title>使用validator验证task空字段</title>
</head>
<body>
<form:form modelAttribute="task" method="post" action="newtask2.action">
    <table>
        <tr>
            <td>title</td>
            <td><form:input path="title"/></td>
            <td><form:errors path="title" cssStyle="color:red"/> </td>
        </tr>
        <tr>
            <td>content</td>
            <td><form:input path="content"/></td>
            <td><form:errors path="content" cssStyle="color:red"/> </td>
        </tr>
    </table>
</form:form>
</body>
</html>
