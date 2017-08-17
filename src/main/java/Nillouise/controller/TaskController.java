package Nillouise.controller;

import Nillouise.model.DeadLineTask;
import Nillouise.model.TagItem;
import Nillouise.model.Task;
import Nillouise.model.UserInfo;
import Nillouise.service.TagItemService;
import Nillouise.service.TaskService;
import Nillouise.service.UserInfoService;
import Nillouise.validator.TaskValidator;
import Nillouise.variable.StringConstant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.jws.WebParam;
import javax.servlet.http.HttpSession;
import java.net.BindException;

/**
 * Created by win7x64 on 2017/7/23.
 */
@Controller
public class TaskController
{
    private static final Logger LOGGER = LoggerFactory.getLogger(TaskController.class);

    @Autowired
    private TaskService taskService;
    @Autowired
    private TagItemService tagItemService;

    @RequestMapping(value = "/addtask.action",method = RequestMethod.POST)
    public String addtask(HttpSession session, String title, String content, int tasktype,Integer[] selecttag)
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

            if(selecttag!=null)
            {
                for (Integer i:selecttag)
                {
                    TagItem tagItem = new TagItem();
                    tagItem.setTagid(i);
                    tagItem.setUserid(userid);
                    tagItem.setTaskid(task.getId());

                    tagItemService.add(tagItem);
                }
            }
        }else {
            return "redirect:/error/addtask.jsp";
        }
        return "redirect:/";
    }

    @RequestMapping(value = "/deltask.action",method = RequestMethod.GET)
    public String deltask(HttpSession session,int id)
    {
        taskService.delete(id);

        return "redirect:/";
    }

    @RequestMapping(value = "deadline")
    public String inputDeadline(Model model)
    {
        model.addAttribute("task",new DeadLineTask());
        return "deadline.jsp";
    }

    @RequestMapping(value = "deadline_save",method = RequestMethod.POST)
    public String saveDeadline(@ModelAttribute DeadLineTask task,
                               BindingResult bindingResult,Model model)
    {
        model.addAttribute("task",task);
        if(bindingResult.hasErrors()){
            FieldError fieldError = bindingResult.getFieldError();
            System.out.println("Code: "+ fieldError.getCode()
                    +", field: "+fieldError.getField()
            );
            return "deadline.jsp";
        }
        System.out.println(task.getDeadline());
        return "deadline.jsp";
    }

    @Autowired
    @Qualifier("taskValidator")
    private TaskValidator taskValidator;

    @RequestMapping(value = "/newtask2.action")
    public String addtask2(@ModelAttribute Task task, Model model, Errors errors)
    {
        model.addAttribute("task",task);
        taskValidator.validate(task,errors);
        if(errors.hasErrors())
        {
            return "gadget/newtaskv2.jsp";
        }
        return "gadget/newtaskv2.jsp";
    }


}
