package Nillouise.service;

import Nillouise.model.Tag;
import Nillouise.model.TagItem;

import java.util.List;

/**
 * Created by win7x64 on 2017/8/10.
 */
public interface TagItemService
{
    boolean add(TagItem tagItem);
    List<Tag> list(int taskid, int begin, int end);
    List<Tag> list(int taskid);
    boolean delete(int tagitemid);
}
