package Nillouise.service;

import Nillouise.mapper.TagItemMapper;
import Nillouise.mapper.TagMapper;
import Nillouise.model.Tag;
import Nillouise.model.TagItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by win7x64 on 2017/8/10.
 */
@Service
public class TagItemServiceImpl implements TagItemService
{
    @Autowired
    TagItemMapper tagItemMapper;

    @Autowired
    TagService tagService;

    public boolean add(TagItem tagItem)
    {
        int cnt = tagItemMapper.add(tagItem);
        return cnt>0;
    }

    public List<Tag> list(int taskid, int begin, int end)
    {
        List<TagItem> tagItems = tagItemMapper.list(taskid,begin,end);
        List<Tag> tags = new ArrayList<Tag>();
        for (TagItem i:tagItems)
        {
            Tag tag = tagService.select(i.getTagid());
            if(tag!=null)
            {
                tags.add(tag);
            }
        }

        return tags;
    }

    public List<Tag> list(int taskid)
    {

        return list(taskid,0,100000);
    }

    public boolean delete(int tagitemid)
    {
        return false;
    }
}
