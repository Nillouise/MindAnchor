package Nillouise.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

// 此controller只用于开发远程开机功能，与其他controller不会有关系


@Controller
public class WakeOnLanController {
    private static long recordTimeNillouise = new Date().getTime();
    private static long recordTimeDieofai = new Date().getTime();

    @RequestMapping(value = "wakeonlan")
    public String page(Model model)
    {
        long curtime = new Date().getTime();
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

        return "wakeonlan.jsp";
    }

    @RequestMapping(value = "wakeonlannillouise.action")
    public String nillouise(Model model)
    {
        long curtime = new Date().getTime();
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
        long curtime = new Date().getTime();
        if(recordTimeDieofai <curtime)
        {
            recordTimeDieofai = curtime;
        }
        recordTimeDieofai += 4*60*1000;
        return "redirect:/wakeonlan";
    }

}
