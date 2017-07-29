package Nillouise.mapper;

import Nillouise.model.Task;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by win7x64 on 2017/7/27.
 */
public interface TaskMapper
{
    public int add(Task task);
    public int update(Task task);
    public int delete(Task task);
//  public List<Task> list(int id);
    public List<Task> list(@Param("userid")int id, @Param("begin")int begin, @Param("end")int end);

}
