package Nillouise.mapper;

import Nillouise.model.Tag;
import Nillouise.model.TagItem;
import Nillouise.model.Task;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by win7x64 on 2017/8/10.
 */
public interface TagItemMapper
{
    public int add(TagItem tagItem);
    public int update(TagItem tagItem);
    public int delete(int tagitemid);
    //public List<Task> list(int id);
    public List<TagItem> list(@Param("taskid")int taskid, @Param("begin")int begin, @Param("end")int end);
}
