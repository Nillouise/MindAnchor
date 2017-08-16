<%-- handnote 包含这个页面的会送一个完整的request过来的 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,Nillouise.model.*,Nillouise.model.Task"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<p style="text-align:center">
    <h5>Mind Energy Management </h5>
<script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/json2.js"></script>
<%--往表格里增加时间的js代码 --%>
<script type="text/javascript">

    var hasShow=false;
    function requestTaskInfo(taskidjson,callbackfun)
    {
        $.ajax("${pageContext.request.contextPath}/json/requesttaskinfo",
            {
                dataType:"json",
                type:"post",
                contentType:"application/json;charset=utf-8",
                data:JSON.stringify(taskidjson),
                async:true,
                success:callbackfun,
                error:function ()
                {
                    console.log("json send fail");
                }
            });

    }

    function channel(){
        //来判断发送的链接
        var schoolBannerInfo = {
            "img": "2",
            "title": "2fdf",
            "info": "2",
            "channelId": "2"
        };

        $.ajax({
            url:"/json/channel",
            type:"post",
            dataType:'json',

            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            data:JSON.stringify(schoolBannerInfo),
            success:function(data){
            alert(data.title);
        },
        error:function(XMLHttpRequest, textStatus, errorThrown){
            alert("Error")
            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        }
    });
    }
    function searchByid(array,id)
    {
        for(var i = 0;i<array.length;i++)
        {
            if(parseInt(array[i].id)==id)
            {
                return array[i];
            }
        }
        return null;
    }

    function taskinfocallback(data)
    {
        var column = document.getElementsByClassName("taskdate");
        for(var i=0;i<column.length;i++)
        {
            if(column[i].id!="")
            {
                var task = searchByid(data,parseInt(column[i].id));
                column[i].innerHTML=new Date(parseInt(task.createtime)).toUTCString();

            }
            column[i].style.display='block';
        }
    }

    function addtablecolumn()
    {
        if(hasShow==false)
        {
            hasShow=true;
            var column = document.getElementsByClassName("taskdate");
            var json={};
            json["taskid"]=[];
            for(var i=0;i<column.length;i++)
            {
                if(column[i].id!="")
                {
                    json["taskid"].push(column[i].id);
                }
                //column[i].style.display='block';
            }
            requestTaskInfo(json,taskinfocallback);
            return;
        }else{
            hasShow=false;
            var column = document.getElementsByClassName("taskdate");
            for(var i=0;i<column.length;i++)
            {
                column[i].style.display='none';
//            column.hidden=false;
            }
            return;
        }


    }


</script>

<style type="text/css">
    .more_info {
        border-bottom: 1px dotted #000;
        position: relative;
        cursor: pointer;
    }

    .more_info .popup {
        position: absolute;
        top: 15px; /*must overlap parent element otherwise pop-up doesn't stay open when rolloing over '*/
        background: #F7E0DA;
        border: 1px solid #ccc;
        padding: 8px;
        left: 0;
        max-width: 240px;
        min-width: 180px;
        z-index: 100;
        display: none;
    }
</style>
<%-- 这些代表 解决在手机不能读title的tooltip问题 --%>
<script type='text/javascript'>//<![CDATA[
window.onload=function(){


    $(document).ready(function () {

        //init pop-ups
        $(".popup").attr("data-close", false);

        //click on pop-up opener.
        //pop-up is expected to be a child of opener
        $(".more_info").click(function () {
            var $title = $(this).find(".popup");
            //open if not marked for closing
            if ($title.attr("data-close") === "false") {
                $title.show();
            }
            //reset popup
            $title.attr("data-close", false);
        });

        //mark pop-up for closing if clicked on
        //close is initiated by document.mouseup,
        //marker will stop opener from re-opening it
        $(".popup").click(function () {
            $(this).attr("data-close",true);
        });

        //hide all pop-ups
        $(document).mouseup(function () {
            $(".popup").hide();

        });

        //show on rollover if mouse is used
        $(".more_info").mouseenter(function () {
            var $title = $(this).find(".popup");
            $title.show();
        });

        //hide on roll-out
        $(".more_info").mouseleave(function () {
            var $title = $(this).find(".popup");
            $title.hide();
        });

    });
}//]]>

</script>

<table id="tasktable" align='center' border='1' cellspacing='0'>
    <tr>
        <th style="display: none;" class="taskdate">Time</th>
        <th>MindEnergy</th>
        <th>Title</th>
    </tr>
    <c:forEach items="${tasks}" var="task" varStatus="st">
        <tr>
            <td style="display: none;" id="${task.id}" class="taskdate">${task.createtime}</td>
            <td><a href="/deltask.action?id=${task.id}"><input type="button" value="del"></a> ${task.costmindenergy}</td>
            <td>
                <span class="more_info" >${task.title}
                    <div class="popup">${task.content}<br/>${task.tagsstring}</div>
                </span>
            </td>
        </tr>
    </c:forEach>
</table>

<input type="button" onclick="addtablecolumn()"/>
<input type="button" onclick="channel()" value="测试ajax"/>
<script>
    // tell the embed parent frame the height of the content
    if (window.parent && window.parent.parent){
        window.parent.parent.postMessage(["resultsFrame", {
            height: document.body.getBoundingClientRect().height,
            slug: "yvs1awzk"
        }], "*")
    }
</script>