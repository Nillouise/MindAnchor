package Nillouise.service;

import Nillouise.mapper.TaskMapper;
import Nillouise.mapper.UserInfoMapper;
import Nillouise.model.TagItem;
import Nillouise.model.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by win7x64 on 2017/7/27.
 */
@Service
public class TaskServiceImpl implements TaskService
{
    @Autowired
    TaskMapper taskMapper;
    @Autowired
    TagItemService tagItemService;

    //返回这个task的id
    public int add(Task task)
    {
        taskMapper.add(task);
        return task.getId();
    }

    public boolean delete(Task task)
    {
        task.setBlock(1);
        int cnt = taskMapper.update(task);
        return cnt>0;
    }

    public boolean delete(int taskid)
    {
        Task task = select(taskid);
        return delete(task);
    }

    public boolean update(Task task)
    {
        return false;
    }

    public List<Task> list(int userid, int begin, int end)
    {
        List<Task> tasks = taskMapper.list(userid,begin,end);
        for (Task i :tasks)
        {
            i.setTags(tagItemService.list(i.getId()));
        }
        return tasks;
    }

    public List<Task> list(int userid)
    {
        List<Task> tasks = list(userid,0,100000);
        for (Task i :tasks)
        {
            i.setTags(tagItemService.list(i.getId()));
        }
        return tasks;
    }

    public Task select(int taskid)
    {
        return taskMapper.select(taskid);
    }

    public List<Task> listDel(int userid, int begin, int end)
    {
        List<Task> tasks = taskMapper.listdel(userid,begin,end);
        for (Task i :tasks)
        {
            i.setTags(tagItemService.list(i.getId()));
        }
        return tasks;
    }
}
