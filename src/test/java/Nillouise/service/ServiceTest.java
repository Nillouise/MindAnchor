package Nillouise.service;

import Nillouise.baseTest.SpringTestCase;
import Nillouise.model.Tag;
import Nillouise.model.TagItem;
import Nillouise.model.Task;
import Nillouise.model.UserInfo;
import Nillouise.tool.MindEnergy;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
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
        task.setCostmindenergy(10);

        taskService.add(task);
    }

    @Test
    public void testTaskSelect() throws Exception
    {
        Task task = taskService.select(6);
        taskService.delete(task);
        System.out.println(task);
    }

    @Test
    public void testTaskBlock() throws Exception
    {
        List<Task> list = taskService.list(1,0,10);
        taskService.delete(list.get(0));
    }

    @Test
    public void taskListTest()
    {
        List<Task> list = taskService.list(1,0,3);
        for(Task t:list)
        {
            System.out.println(t);
        }

    }

    @Test
    public void taskPrimaryKey() throws Exception
    {
        Task task = new Task();
        task.setUserid(1);
        task.setContent("test content");
        task.setTitle("test title");
        task.setCostmindenergy(10);
        taskService.add(task);
        System.out.println(task.getId());
    }

    @Test
    public void testMindEnergy()
    {
        Date cur = new Date(new Date().getTime() -1000*60*6*100);
        MindEnergy  mindEnergy =  new MindEnergy(cur,0);
        System.out.println(mindEnergy.getLasttime());
        System.out.println(mindEnergy.getCurmindenergy());
    }

    @Test
    public void testupdate()
    {
        List<UserInfo> list = userInfoService.list();
        UserInfo userInfo = list.get(0);
        Date date = new Date();
        userInfo.setPremindenergytime(new Date());
        userInfo.setPremindenergy(55);
        userInfoService.update(userInfo);
    }
    @Test
    public void testrecoverupdate()
    {
        List<UserInfo> list = userInfoService.list();
        UserInfo userInfo = list.get(0);
        userInfo.setPremindenergytime(new Date(new Date().getTime()-10000000));
        userInfoService.update(userInfo);
    }

    @Autowired
    private TagService tagService;

    @Test
    public void testTagService()
    {
        List<Tag> list = tagService.list(1,0,10);
        Tag t = new Tag();
        t.setUserid(1);
        t.setTitle("junit");
        t.setContent("content");
        tagService.add(t);

        for (Tag i :list)
        {
            System.out.println(i);
        }
        t = tagService.select(1);
        System.out.println("测试select "+t);
    }

    @Autowired
    private TagItemService tagItemService;

    @Test
    public void testTagItemService()
    {
        List<Tag> list = tagItemService.list(1);
    }


}
