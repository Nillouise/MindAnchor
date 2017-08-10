package Nillouise.mapper;

import Nillouise.model.Tag;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by win7x64 on 2017/8/10.
 */
public interface TagMapper
{
    public int add(Tag tag);
    public int update(Tag tag);
    public int delete(int tagid);
    //public List<Task> list(int id);
    public List<Tag> list(@Param("userid")int id, @Param("begin")int begin, @Param("end")int end);
}
