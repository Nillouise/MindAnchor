package Nillouise.aop;

import Nillouise.controller.CRUDController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.support.RequestContext;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by win7x64 on 2017/8/15.
 */

public class LoginAop
{
    private static final Logger LOGGER = LoggerFactory.getLogger(LoginAop.class);
    public void beforeLogin()
    {
        LOGGER.info("登录时间"+new Date());

        testLocale();
    }

    public void afterLogin()
    {
        LOGGER.info("登录完成时间"+new Date());
    }


    public void testLocale()
    {
        //这里利用全局对象获得request，貌似aop不受spring的自动选参数传（像controller那样）传参机制管理
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes()).getRequest();
        RequestContext context = new RequestContext(request);
        String username = context.getMessage("username");
        LOGGER.info("Locale username: "+username);
    }
}
