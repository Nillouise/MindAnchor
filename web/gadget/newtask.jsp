<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,Nillouise.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 这里是/addtask.action,有/表示是绝对路径url --%>
<form action="/addtask.action" method="post">
    title<br/>
    <select name="tasktype" >
        <option value="15">15</option>
        <option value="10">10</option>
    </select><br/>
    <input type="text" name="title" style="width: 80%;"/><br/>
    <input type="text" name="content" style="height: 100px;width: 80%;"><br/>
    tags:<br/>
    <c:forEach items="${usertags}" var="tag" varStatus="vs">
        <label><input type="checkbox" name="selecttag" value="${tag.id}">${tag.title}</label>
    </c:forEach>
    <br/>
    <input type="submit" name="" id="submit">
</form>