package all;

import Nillouise.controller.LoginController;
import Nillouise.mapper.UserInfoMapper;
import Nillouise.model.UserInfo;
import Nillouise.service.UserInfoServiceImpl;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.InputStream;
import java.util.Date;
import java.util.List;

/**
 * Created by win7x64 on 2017/7/21.
 */
public class testAny
{
    private static final Logger LOGGER = LoggerFactory.getLogger(testAny.class);
    //只测试Batis的，不结合spring mvc
    @Test
    public void onlyBatis() throws Exception
    {
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session = sqlSessionFactory.openSession();

        UserInfoMapper mapper = session.getMapper(UserInfoMapper.class);
        List<UserInfo> ul = mapper.list();

//        UserInfo i = session.select("get");
  //      List<UserInfo> ul = session.selectList("ldfdist");
        System.out.println(session.getConfiguration());
        System.out.println(session);
        for(UserInfo u :ul)
        {
            System.out.println(u);
        }
    }

    @Test
    public void log() throws Exception
    {
        LOGGER.info("dfdfd");


    }


}
