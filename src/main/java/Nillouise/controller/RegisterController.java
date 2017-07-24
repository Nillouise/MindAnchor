package Nillouise.controller;

import Nillouise.model.UserInfo;
import Nillouise.service.UserInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by win7x64 on 2017/7/23.
 */
@Controller
public class RegisterController
{
    private static final Logger LOGGER = LoggerFactory.getLogger(RegisterController.class);

    @Autowired
    private UserInfoService userInfoService;

    @RequestMapping(value = "/registerpage",method = RequestMethod.GET)
    public String updateBook(Model model)
    {
        model.addAttribute("userinfo",new UserInfo());
        return "registerpage.jsp";
    }

    @RequestMapping(value = "/register.action",method = RequestMethod.POST)
    public String datebind(@ModelAttribute("userinfo") UserInfo userInfo)
    {
        userInfoService.add(userInfo);
        return "redirect:/showuser";
    }



}
