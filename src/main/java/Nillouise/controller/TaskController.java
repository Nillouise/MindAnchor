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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * Created by win7x64 on 2017/7/23.
 */
@Controller
public class TaskController
{
    private static final Logger LOGGER = LoggerFactory.getLogger(TaskController.class);

    @Autowired
    private TaskService taskService;


    @RequestMapping(value = "/addtask.action",method = RequestMethod.POST)
    public String addtask(HttpSession session, String title, String content, int tasktype)
    {
        Boolean login = (Boolean)session.getAttribute(StringConstant.loginStatus);
        if(login==null || login==false)
        {
            return "redirect:/login";
        }

        UserInfo userInfo = (UserInfo) session.getAttribute(StringConstant.userInfo);
        int userid = userInfo.getId();
        LOGGER.info(title + " " +content+" 消耗体力： "+tasktype);

        if(userInfo.subCurmindenergy(tasktype))
        {
            Task task = new Task();
            task.setTitle(title);
            task.setCostmindenergy(tasktype);
            task.setContent(content);
            task.setUserid(userid);
            taskService.add(task);
        }else {
            return "redirect:/error/addtask.jsp";
        }

        return "redirect:/";
    }
}
