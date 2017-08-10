package Nillouise.service;

import Nillouise.model.Tag;

import java.util.List;

/**
 * Created by win7x64 on 2017/8/10.
 */
public interface TagService
{
    boolean add(Tag tag);
    List<Tag> list(int userid, int begin, int end);
    boolean delete(int tagid);
}
