package Nillouise.controller;

import Nillouise.model.UserInfo;
import Nillouise.variable.StringConstant;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;

// 此controller只用于开发远程开机功能，与其他controller不会有关系


@Controller
public class WakeOnLanController {
    private static long recordTimeNillouise = System.currentTimeMillis();
    private static long recordTimeDieofai = System.currentTimeMillis();

//
//    public String manage(HttpSession session)
//    {
//        Boolean isLogin = (Boolean)session.getAttribute("loginStatus");
//        if(isLogin==null){ isLogin = false;}
//
//        if(isLogin)
//        {
//            UserInfo userInfo = (UserInfo)session.getAttribute(StringConstant.userInfo);
//            List<Tag> tags = tagService.list(userInfo.getId());
//            session.setAttribute("tags",tags);
//            return "tagmanage.jsp";


            @RequestMapping(value = "wakeonlan")
    public String page(Model model,HttpSession session)
    {
        long curtime = System.currentTimeMillis();
        if(recordTimeNillouise < curtime)
        {
            recordTimeNillouise = curtime;
        }
        if(recordTimeDieofai < curtime)
        {
            recordTimeDieofai = curtime;
        }

        model.addAttribute("timecountnillouise", recordTimeNillouise - curtime);
        model.addAttribute("timecountdieofai",recordTimeDieofai - curtime);


        Boolean isLogin = (Boolean)session.getAttribute("loginStatus");
        if(isLogin==null){ isLogin = false;}

        if(isLogin) {
            UserInfo userInfo = (UserInfo) session.getAttribute(StringConstant.userInfo);
            String username = userInfo.getUsername();
            if("mind".equals(username))
            {
                return "wakeonlan.jsp";
            }
        }
        return "redirect:/";
    }

    @RequestMapping(value = "wakeonlannillouise.action")
    public String nillouise(Model model)
    {
        long curtime = System.currentTimeMillis();
        if(recordTimeNillouise <curtime)
        {
            recordTimeNillouise = curtime;
        }
        recordTimeNillouise += 4*60*1000;
        return "redirect:/wakeonlan";
    }

    @RequestMapping(value = "wakeonlandieofai.action")
    public String dieofai(Model model)
    {
        long curtime = System.currentTimeMillis();
        if(recordTimeDieofai <curtime)
        {
            recordTimeDieofai = curtime;
        }
        recordTimeDieofai += 4*60*1000;
        return "redirect:/wakeonlan";
    }

}
