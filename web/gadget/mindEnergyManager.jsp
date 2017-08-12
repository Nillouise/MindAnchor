<%-- handnote 包含这个页面的会送一个完整的request过来的 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,Nillouise.model.*,Nillouise.model.Task"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<p style="text-align:center">
    <h5>Mind Energy Management </h5>
<script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
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

<table align='center' border='1' cellspacing='0'>
    <tr>
        <th>MindEnergy</th>
        <th>Title</th>
    </tr>
    <c:forEach items="${tasks}" var="task" varStatus="st">
        <tr>
            <td><a href="/deltask.action?id=${task.id}"><input type="button" value="del"></a> ${task.costmindenergy}</td>
            <td>
                <span class="more_info" >${task.title}
                    <div class="popup">${task.content}<br/>${task.tagsstring}</div>
                </span>
            </td>
        </tr>
    </c:forEach>
</table>

<script>
    // tell the embed parent frame the height of the content
    if (window.parent && window.parent.parent){
        window.parent.parent.postMessage(["resultsFrame", {
            height: document.body.getBoundingClientRect().height,
            slug: "yvs1awzk"
        }], "*")
    }
</script>