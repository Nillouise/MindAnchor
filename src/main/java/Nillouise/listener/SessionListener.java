package Nillouise.listener;


import Nillouise.model.UserInfo;
import Nillouise.service.UserInfoService;
import Nillouise.service.UserInfoServiceImpl;
import Nillouise.variable.StringConstant;
import com.mysql.cj.api.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.List;



public class SessionListener implements HttpSessionListener
{

    //这里好像不能用spring的注入 https://stackoverflow.com/questions/11718216/httpsessionlistener-using-spring-injections-and-services-impossible-to-access
    //这里搞得连 UserInfoService 里面的 UserInfoMapper 都不能正常注入了。。。
//    @Autowired
//    private UserInfoService userInfoService;



    private static final Logger LOGGER = LoggerFactory.getLogger(SessionListener.class);
    public void sessionCreated(HttpSessionEvent httpSessionEvent)
    {
        LOGGER.info("create session "+httpSessionEvent);
    }

    public void sessionDestroyed(HttpSessionEvent httpSessionEvent)
    {
        UserInfoService userInfoService = getUserInfoService(httpSessionEvent);


        LOGGER.info("destroy session "+httpSessionEvent);
        HttpSession session = httpSessionEvent.getSession();
        UserInfo userInfo = (UserInfo)session.getAttribute(StringConstant.userInfo);
        if(userInfo!=null)
        {
            userInfoService.update(userInfo);
        }
        return;
    }

    private UserInfoService getUserInfoService(HttpSessionEvent httpSessionEvent)
    {

        HttpSession session = httpSessionEvent.getSession();

        ApplicationContext ctx =
                WebApplicationContextUtils.
                        getWebApplicationContext(session.getServletContext());

        // 通过这种用web的功能获取spring的context，然后从context中获得bean对象，默认的userInfoService名字就叫userInfoServiceImpl（跟我定义的impl类名一样）
        //貌似不能用自己在spring的xml文件里在建一个同样类型的对象（貌似是单例的）
        UserInfoService counterService =
                (UserInfoService) ctx.getBean("userInfoServiceImpl");

        return counterService;
    }


}