package Nillouise.service;

import Nillouise.model.Task;

import java.util.List;

/**
 * Created by win7x64 on 2017/7/27.
 */
public interface TaskService
{
    //失败返回-1，其他返回task的id
    int add(Task task);
    boolean delete(Task task);
    boolean delete(int taskid);
    boolean update(Task task);
    List<Task> list(int userid, int begin, int end);
    List<Task> listDel(int userid, int begin, int end);
    Task select(int taskid);
//    List<Task> list(int userid);
}
