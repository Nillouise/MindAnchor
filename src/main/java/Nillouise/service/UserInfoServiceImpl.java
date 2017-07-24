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
        String logString = "logging list"+list;
        LOGGER.debug(logString);
        return list;
    }


    public boolean add(UserInfo userInfo)
    {
        boolean success = userInfoMapper.add(userInfo) > 0;
        String logString = "register "+userInfo.toString()+String.valueOf(success);
        LOGGER.debug(logString );
        System.out.println(logString);
        return success;
    }
}
