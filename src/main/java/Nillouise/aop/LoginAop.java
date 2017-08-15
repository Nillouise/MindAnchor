package Nillouise.aop;

import Nillouise.controller.CRUDController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Date;

/**
 * Created by win7x64 on 2017/8/15.
 */

//现阶段还无法在springmvc里启用
public class LoginAop
{
    private static final Logger LOGGER = LoggerFactory.getLogger(LoginAop.class);
    public void beforeLogin()
    {
        LOGGER.info("登录时间"+new Date());
    }

    public void afterLogin()
    {
        LOGGER.info("登录完成时间"+new Date());
    }

}
