package Nillouise.controller;


import Nillouise.model.UserInfo;
import Nillouise.service.UserInfoService;
import Nillouise.service.UserInfoServiceImpl;
import Nillouise.variable.StringConstant;
import com.mysql.cj.api.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.List;

@Controller
public class SessionListener implements HttpSessionListener
{

    //这里好像不能用spring的注入 https://stackoverflow.com/questions/11718216/httpsessionlistener-using-spring-injections-and-services-impossible-to-access
    //这里搞得连 UserInfoService 里面的 UserInfoMapper 都不能正常注入了。。。
//    @Autowired
    private UserInfoService userInfoService;

    public SessionListener()
    {
        userInfoService = new UserInfoServiceImpl();
    }

    private static final Logger LOGGER = LoggerFactory.getLogger(SessionListener.class);
    public void sessionCreated(HttpSessionEvent httpSessionEvent)
    {
        LOGGER.info("create session "+httpSessionEvent);
    }

    public void sessionDestroyed(HttpSessionEvent httpSessionEvent)
    {
        LOGGER.info("destroy session "+httpSessionEvent);
        HttpSession session = httpSessionEvent.getSession();
        UserInfo userInfo = (UserInfo)session.getAttribute(StringConstant.userInfo);
        if(userInfo!=null)
        {
            userInfoService.update(userInfo);
        }
        return;
    }
}