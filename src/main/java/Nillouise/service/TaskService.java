package Nillouise.service;

import Nillouise.model.Task;

import java.util.List;

/**
 * Created by win7x64 on 2017/7/27.
 */
public interface TaskService
{
    boolean add(Task task);
    boolean delete(Task task);
    boolean update(Task task);
    List<Task> list(int userid, int begin, int end);
    List<Task> list(int userid);
}
