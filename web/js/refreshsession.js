/**
 * Created by win7x64 on 2017/9/13.
 */

// 这里应该依赖于json2和jq
function sendmyJson(url, sendJson, callbackfun)
{
    $.ajax("/json/"+url,
        {
            dataType:"json",
            type:"post",
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify(sendJson),
            async:true,
            success:callbackfun,
            error: function(XMLHttpRequest, textStatus, errorThrown) {
            },
        });

}

setInterval(refreshsession,1000*30)

function refreshsession()
{
    sendmyJson("refreshsession.do",{refresh:true},function (data) {
        console.log(data);
    })
}