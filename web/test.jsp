<%--
  Created by IntelliJ IDEA.
  User: win7x64
  Date: 2017/7/27
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String manage = request.getParameter("manage");
    if(manage!=null && manage.equals("true"))
    {
%>
<jsp:include page="gadget/mindEnergyManager.jsp"></jsp:include>
<%
    }
%>

</body>
</html>
