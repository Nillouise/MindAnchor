package Nillouise.controller;

import Nillouise.model.Task;
import Nillouise.model.UserInfo;
import Nillouise.service.TaskService;
import Nillouise.service.UserInfoService;
import Nillouise.variable.StringConstant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by win7x64 on 2017/7/28.
 */
@Controller
public class IndexController
{
    private static final Logger LOGGER = LoggerFactory.getLogger(IndexController.class);
    @Autowired
    private TaskService taskService;

    @RequestMapping(value = "/",
            method = {RequestMethod.GET})
    public String loginPage(HttpSession session,Model model)
    {
        System.out.println("through index controller");

        Boolean isLogin = (Boolean)session.getAttribute(StringConstant.loginStatus);
        UserInfo userInfo = (UserInfo)session.getAttribute(StringConstant.userInfo);

        if(isLogin==null ||isLogin==false)
        {
            return "/index.jsp";
        }
        List<Task> list = taskService.list(userInfo.getId(),0,10);
        model.addAttribute("tasks",list);
        return "/index.jsp";
    }


}
