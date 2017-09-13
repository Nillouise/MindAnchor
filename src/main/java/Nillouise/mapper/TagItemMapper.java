package Nillouise.mapper;

import Nillouise.model.Tag;
import Nillouise.model.TagItem;
import Nillouise.model.Task;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *
 */

public interface TagItemMapper
{
    int add(TagItem tagItem);
    int update(TagItem tagItem);
    int delete(int tagitemid);
    //public List<Task> list(int id);
    List<TagItem> list(@Param("taskid")int taskid, @Param("begin")int begin, @Param("end")int end);
}
