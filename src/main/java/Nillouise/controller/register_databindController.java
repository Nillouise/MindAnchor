package Nillouise.controller;

import Nillouise.model.UserInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Created by win7x64 on 2017/7/23.
 */
@Controller
public class register_databindController
{
    @RequestMapping(value = "/register_databind",method = RequestMethod.POST)
    public String updateBook(@ModelAttribute("userinfo") UserInfo userInfo)
    {

        System.out.println(userInfo);

        return "redirect:/showuser.jsp";
    }

    @RequestMapping(value = "/datebind",method = RequestMethod.GET)
    public String datebind(Model model)
    {
        UserInfo userInfo = new UserInfo();
        userInfo.setPassword("fdsf");
        userInfo.setUsername("mary");
        model.addAttribute("userinfo",userInfo);
        return "register_databind.jsp";
    }
}
