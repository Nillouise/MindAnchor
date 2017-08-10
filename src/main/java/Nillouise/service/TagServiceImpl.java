package Nillouise.service;

import Nillouise.mapper.TagMapper;
import Nillouise.mapper.TaskMapper;
import Nillouise.model.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by win7x64 on 2017/8/10.
 */
@Service
public class TagServiceImpl implements TagService
{
    @Autowired
    TagMapper tagMapper;

    public boolean add(Tag tag)
    {
        int cnt = tagMapper.add(tag);
        return cnt>0;
    }

    public List<Tag> list(int userid, int begin, int end)
    {
        List<Tag> r = tagMapper.list(userid,begin,end);
        return r;
    }

    public boolean delete(int tagid)
    {
        int cnt = tagMapper.delete(tagid);
        return cnt>0;
    }
}
