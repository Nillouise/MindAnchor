<%--
  Created by IntelliJ IDEA.
  User: win7x64
  Date: 2017/7/20
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Mind Anchor</title>
    <link rel="stylesheet" href="css/background.css" type="text/css"/>
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/json2.js"></script>
    <script type="text/javascript" src="/js/refreshsession.js"></script>
  </head>
  <body>
  <jsp:include page="gadget/headerTool.jsp"></jsp:include>
  首页内容
  <jsp:include page="gadget/mindEnergyManager.jsp"></jsp:include>
  <jsp:include page="gadget/newtask.jsp"></jsp:include>
  <br/>
  <a href="/wakeonlan">打开电脑</a>

  </body>
</html>
