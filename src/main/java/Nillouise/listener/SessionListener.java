package Nillouise.listener;

import Nillouise.interceptor.MindEnergyInterceptor;
import Nillouise.model.UserInfo;
import Nillouise.service.UserInfoService;
import Nillouise.variable.StringConstant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListener implements HttpSessionListener {

    @Autowired
    private UserInfoService userInfoService;

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