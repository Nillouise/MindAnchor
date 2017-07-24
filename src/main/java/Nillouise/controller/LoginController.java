package Nillouise.controller;

import Nillouise.model.LoginForm;
import Nillouise.model.UserInfo;
import Nillouise.service.UserInfoService;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

/**
 * Created by win7x64 on 2017/7/21.
 */


@Controller
public class LoginController
{
    private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    private UserInfoService userInfoService;

    @RequestMapping(value = "/login",
            method = {RequestMethod.GET})
    public String loginPage(HttpSession session)
    {
        Boolean isLogin = (Boolean)session.getAttribute("loginStatus");
        if(isLogin==null){ isLogin = false;}

        if(isLogin)
        {
            return "redirect:/";
        }
        else {
            return "login.jsp";
        }
    }

    @RequestMapping(value = "/login.action",
            method = {RequestMethod.POST})
    public String loginActionPage(LoginForm loginForm, HttpSession session)
    {
        UserInfo curUser = new UserInfo();
        curUser.copyFrom(loginForm);
        boolean loginSuccess = userInfoService.select(curUser);

        if(loginSuccess)
        {
            session.setAttribute("loginStatus",true);
            session.setAttribute("userInfo",curUser);
            return "redirect:/";
        }else{
            session.setAttribute("loginStatus",false);
            session.setAttribute("tryLoginFail",true);
            return "redirect:/login";
        }
    }

}
