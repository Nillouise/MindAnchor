package Nillouise.service;

import Nillouise.baseTest.SpringTestCase;
import Nillouise.model.Task;
import Nillouise.model.UserInfo;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by win7x64 on 2017/7/22.
 */
public class ServiceTest extends SpringTestCase
{
    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private TaskService taskService;

    @Test
    public void showUser()
    {

        List<UserInfo> users = userInfoService.list();
  //      userInfoService.add(new UserInfo());
//        for(UserInfo user:users)
//        {
//            System.out.println("test mindanchor");
//            System.out.println(user);
//        }
    }

    @Test
    public void taskTest()
    {
        Task task = new Task();
        task.setUserid(1);
        task.setContent("test content");
        task.setTitle("test title");
        task.setMindEnergy(10);

        taskService.add(task);
    }

}
