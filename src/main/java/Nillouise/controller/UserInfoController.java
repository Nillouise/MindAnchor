package Nillouise.controller;

import Nillouise.model.UserInfo;
import Nillouise.service.UserInfoService;
import Nillouise.variable.StringConstant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by win7x64 on 2017/7/22.
 */
@Controller
public class UserInfoController
{
    private static final Logger LOGGER = LoggerFactory.getLogger(UserInfoController.class);

    @Autowired
    private UserInfoService userInfoService;

    @RequestMapping(value = "/changeuserinfo",
            method = {RequestMethod.GET})
    public String page(Model model, HttpSession session)
    {
        session.getAttribute(StringConstant.userInfo);
        UserInfo userInfo = (UserInfo)session.getAttribute(StringConstant.userInfo);
        model.addAttribute("userinfo",userInfo);
        return "showuserinfo.jsp";

    }
    @RequestMapping(value = "changeuserinfo.action",method = {RequestMethod.POST})
    public String change(UserInfo userinfo)
    {
        System.out.println(userinfo);
        return "redirect:/";
    }

}
