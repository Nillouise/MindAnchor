package Nillouise.mapper;

import Nillouise.model.Task;

import java.util.List;

/**
 * Created by win7x64 on 2017/7/27.
 */
public interface TaskMapper
{
    public int add(Task task);
    public int update(Task task);
    public int delete(Task task);
    public List<Task> list(int id);

}
