package Nillouise.service;

import Nillouise.controller.CRUDController;
import Nillouise.mapper.UserInfoMapper;
import Nillouise.model.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * Created by win7x64 on 2017/7/21.
 */
@Service
public class UserInfoServiceImpl implements UserInfoService
{
    @Autowired
    UserInfoMapper userInfoMapper;

    private static final Logger LOGGER = LoggerFactory.getLogger(UserInfoServiceImpl.class);


    public List<UserInfo> list()
    {
        List<UserInfo> list = userInfoMapper.list();
        String logString = "logging list: "+list;
        LOGGER.info(logString);
        return list;
    }


    public boolean add(UserInfo userInfo)
    {
        boolean success = userInfoMapper.add(userInfo) > 0;
        String logString = "Add user: " +userInfo.toString()+" "+String.valueOf(success);
        LOGGER.info(logString );
        return success;
    }

    public boolean select(UserInfo userInfo)
    {
        List<UserInfo> list = userInfoMapper.select(userInfo);
        if(list.isEmpty())
        {
            return false;
        }
        else {
            UserInfo r = list.get(0);
            userInfo.copyFrom(r);
            return true;
        }
    }
}
