package Nillouise.controller;

import Nillouise.model.LoginForm;
import Nillouise.model.UserInfo;
import Nillouise.service.LoginChecker;
import Nillouise.service.UserInfoService;
import com.sun.net.httpserver.HttpServer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * Created by win7x64 on 2017/7/22.
 */
@Controller
public class CRUDController
{
    private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private UserInfoService userInfoService;

    @RequestMapping(value = "/showuser",
            method = {RequestMethod.GET})
    public ModelAndView selectUser()
    {
        List<UserInfo> list =  userInfoService.list();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("showuser.jsp");
        mav.addObject("users",list);

        return mav;

    }

    @RequestMapping(value = "/register.action",
            method = {RequestMethod.POST})
    public ModelAndView addUser(HttpServletRequest  request)
    {

        List<UserInfo> list =  userInfoService.list();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("showuser.jsp");
        mav.addObject("users",list);

        return mav;

    }

}