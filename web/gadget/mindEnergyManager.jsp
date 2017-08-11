<%-- handnote 包含这个页面的会送一个完整的request过来的 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,Nillouise.model.*,Nillouise.model.Task"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<p style="text-align:center">
    <h5>Mind Energy Management </h5>

<table align='center' border='1' cellspacing='0'>
    <tr>
        <th>MindEnergy</th>
        <th>Title</th>
    </tr>
    <c:forEach items="${tasks}" var="task" varStatus="st">
        <tr>
            <td><a href="/deltask.action?id=${task.id}"><input type="button" value="del"></a> ${task.costmindenergy}</td>
            <td  title="${task.content}&#10;${task.tagsstring}">${task.title}</td>
        </tr>
    </c:forEach>
</table>

