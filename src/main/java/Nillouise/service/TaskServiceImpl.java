package Nillouise.service;

import Nillouise.mapper.TaskMapper;
import Nillouise.mapper.UserInfoMapper;
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

    public boolean add(Task task)
    {

        return taskMapper.add(task)>0;
    }

    public boolean delete(Task task)
    {
        return false;
    }

    public boolean update(Task task)
    {
        return false;
    }

    public List<Task> list(int userid, int begin, int end)
    {
        return null;
    }

    public List<Task> list(int userid)
    {
        List<Task> r = taskMapper.list(userid);
        return r;
    }
}
