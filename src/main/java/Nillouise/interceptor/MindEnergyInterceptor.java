package Nillouise.interceptor;


import Nillouise.controller.LoginController;
import Nillouise.model.UserInfo;
import Nillouise.tool.MindEnergy;
import Nillouise.variable.StringConstant;
import com.mysql.cj.api.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by win7x64 on 2017/7/31.
 */
public class MindEnergyInterceptor extends HandlerInterceptorAdapter
{
    private static final Logger LOGGER = LoggerFactory.getLogger(MindEnergyInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
    {
        LOGGER.debug("test mindenergy intercepter");
        HttpSession session = request.getSession();
        UserInfo userInfo = (UserInfo)session.getAttribute(StringConstant.userInfo);
        if(userInfo==null)
        {
            return super.preHandle(request, response, handler);
        }
        MindEnergy mindEnergy = new MindEnergy(userInfo.getPremindenergytime(),userInfo.getPremindenergy(),userInfo.getMaxmindenergy());
        userInfo.setPremindenergy(mindEnergy.getCurmindenergy());
        userInfo.setPremindenergytime(mindEnergy.getLasttime());

        return super.preHandle(request, response, handler);
    }
}
