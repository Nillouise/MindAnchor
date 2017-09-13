<%-- handnote 包含这个页面的会送一个完整的request过来的 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,Nillouise.model.UserInfo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<p style="text-align:center">
    <a href="/">top bar</a>&nbsp;&nbsp;&nbsp;&nbsp;

    <%--<c:if var="loggedIn" test="${'true'==sessionScope['loginStatus']}"/>--%>
    <%--${loggedIn}--%>
    <%-- 已经登录--%>
    <c:if test="${'true'==sessionScope['loginStatus']}">
        <script>
            window.setInterval(refreshMindEnergy,1000*60*6);
            window.setInterval(refreshGapTaskTime,1000);


            function refreshMindEnergy()
            {
                var ele = document.getElementById("mindenergy");
                var i = parseInt(ele.innerText);
                i++;
                ele.innerText=i;
            }

            function refreshGapTaskTime()
            {
                <c:if test="${tasks.size()>0}">
                    var lastUTC = new Date(${tasks[0].createtime.time}).toUTCString();
                    var curUTC = new Date().toString();

                    var dateStr = lastUTC.trim().split(" ");
                    var strGMT = dateStr[0]+" "+dateStr[1]+" "+dateStr[2]+" "+dateStr[5]+" "+dateStr[3]+" "+dateStr[4]+" GMT+0800";
                    var lasttime = new Date(strGMT).getTime();
                    var curtime = new Date(curUTC).getTime();
                    var gap = curtime-lasttime;
                    var ele = document.getElementById("gaptasktime");


                    ele.innerText = parseInt(gap/(1000*60*60)) +"h "+ parseInt(gap/(1000*60))%60;
                </c:if>
                <c:if test="${tasks.size()==0}">
                    var ele = document.getElementById("gaptasktime");
                    ele.innerText = 0;
                </c:if>
            }

        </script>

        <span id="gaptasktime" style="float: left;">
        </span>
        <span style="font-weight: bold;">Mind Energy:
            <span id = "mindenergy"> ${sessionScope['userInfo']['curmindenergy']} </span>/ ${sessionScope['userInfo']['maxmindenergy']}
        </span>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="/changeuserinfo">
                ${sessionScope['userInfo']['username']}
        </a>
        <a href="/loginout.action">注销</a>&nbsp;
        <a href='/tagmanage'>标签</a>
    </c:if>
    <%-- handnote 这里一定要打括号才行，jstl的优先级应该有问题 --%>
    <%-- 没有登录--%>
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

