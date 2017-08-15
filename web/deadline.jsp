<%--
  Created by IntelliJ IDEA.
  User: win7x64
  Date: 2017/8/14
  Time: 1:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form:form commandName="task" action="deadline_save" method="post">
    <fieldset>
        <%--这里error这里，path跟deadline一样，好像是专门用来接收deadline的parse错误的 --%>
        <form:errors path="deadline" cssClass="error"/>
        <form:input path="deadline"/>
        <input type="submit" value="submit"/>
    </fieldset>


</form:form>

</body>
</html>
