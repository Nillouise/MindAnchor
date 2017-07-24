<%-- handnote 包含这个页面的会送一个完整的request过来的 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,Nillouise.model.UserInfo"%>
<p style="text-align:center">
    top bar&nbsp;&nbsp;&nbsp;&nbsp;
    <%
        Boolean loginStatus = (Boolean)(request.getSession().getAttribute("loginStatus"));
        if(loginStatus==null)loginStatus=false;
        if(loginStatus)
        {
            UserInfo userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
            response.getWriter().println(userInfo.getUsername());
        }
        else {
    %>
    <a href='/login'> 登录 </a>
    <a href='/registerpage'> 注册 </a>
    <%
        }
    %>


</p>

