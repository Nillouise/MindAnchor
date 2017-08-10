package Nillouise.model;

import java.util.Date;

/**
 * Created by win7x64 on 2017/8/10.
 */
public class TagItem
{
    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public int getUserid()
    {
        return userid;
    }

    public void setUserid(int userid)
    {
        this.userid = userid;
    }

    public int getTagid()
    {
        return tagid;
    }

    public void setTagid(int tagid)
    {
        this.tagid = tagid;
    }

    public int getTaskid()
    {
        return taskid;
    }

    public void setTaskid(int taskid)
    {
        this.taskid = taskid;
    }

    public Date getCreatetime()
    {
        return createtime;
    }

    public void setCreatetime(Date createtime)
    {
        this.createtime = createtime;
    }

    int id;
    int userid;
    int tagid;
    int taskid;
    Date createtime;
}
