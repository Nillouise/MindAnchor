package Nillouise.controller;

import Nillouise.model.UserInfo;
import Nillouise.service.TaskService;
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
public class TaskController
{
    private static final Logger LOGGER = LoggerFactory.getLogger(TaskController.class);

    @Autowired
    private TaskService taskService;


    @RequestMapping(value = "/addtask.action",method = RequestMethod.POST)
    public String addtask(String title,String content,int tasktype)
    {
        LOGGER.info(title + " " +content+" 消耗体力： "+tasktype);



        return "redirect:/showuser";
    }
}
