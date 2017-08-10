package Nillouise.controller;

import Nillouise.model.Tag;
import Nillouise.model.UserInfo;
import Nillouise.service.TagService;
import Nillouise.service.UserInfoService;
import Nillouise.variable.StringConstant;
import org.omg.CORBA.Request;
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
 * Created by win7x64 on 2017/8/10.
 */

@Controller
public class TagController
{
    private static final Logger LOGGER = LoggerFactory.getLogger(TagController.class);
    @Autowired
    private TagService tagService;

    @RequestMapping(value = "/tagmanage",method = RequestMethod.GET)
    public String manage(HttpSession session)
    {
        Boolean isLogin = (Boolean)session.getAttribute("loginStatus");
        if(isLogin==null){ isLogin = false;}

        if(isLogin)
        {
            UserInfo userInfo = (UserInfo)session.getAttribute(StringConstant.userInfo);
            List<Tag> tags = tagService.list(userInfo.getId());
            session.setAttribute("tags",tags);
            return "tagmanage.jsp";
        }
        else {
            return "redirect:/login.jsp";
        }
    }

    @RequestMapping(value = "/addtag.action",method = RequestMethod.POST)
    public String addtag(HttpSession session,String title,String content)
    {
        UserInfo userInfo = (UserInfo)session.getAttribute(StringConstant.userInfo);
        Tag tag = new Tag();
        tag.setUserid(userInfo.getId());
        tag.setContent(content);
        tag.setTitle(title);
        tagService.add(tag);

        return "redirect:/tagmanage";
    }

}
