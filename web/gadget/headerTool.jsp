<%-- handnote 包含这个页面的会送一个完整的request过来的 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,Nillouise.model.UserInfo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<p style="text-align:center">
    top bar&nbsp;&nbsp;&nbsp;&nbsp;

    <%--<c:if var="loggedIn" test="${'true'==sessionScope['loginStatus']}"/>--%>
    <%--${loggedIn}--%>

    <c:if test="${'true'==sessionScope['loginStatus']}">
        <span style="font-weight: bold;">Mind Energy:
        ${sessionScope['userInfo']['curmindenergy']} / ${sessionScope['userInfo']['maxmindenergy']}
        </span>
        &nbsp;&nbsp;&nbsp;&nbsp;
        ${sessionScope['userInfo']['username']}
        <a href="/loginout.action">注销</a>&nbsp;
        <a href='/tagmanage'>标签</a>
    </c:if>
    <%-- handnote 这里一定要打括号才行，jstl的优先级应该有问题 --%>
    <c:if test="${!('true'==sessionScope['loginStatus'])}">
        <a href='/login'> 登录 </a>&nbsp;
        <a href='/registerpage'> 注册 </a>&nbsp;
    </c:if>


    <%--<%--%>
        <%--Boolean loginStatus = (Boolean)(request.getSession().getAttribute("loginStatus"));--%>
        <%--if(loginStatus==null)loginStatus=false;--%>
        <%--if(loginStatus)--%>
        <%--{--%>
            <%--UserInfo userInfo = (UserInfo)request.getSession().getAttribute("userInfo");--%>
            <%--response.getWriter().println(userInfo.getUsername());--%>
        <%--}--%>
        <%--else {--%>
    <%--%>--%>
    <%--<a href='/login'> 登录 </a>--%>
    <%--<a href='/registerpage'> 注册 </a>--%>
    <%--<%--%>
        <%--}--%>
    <%--%>--%>


</p>

