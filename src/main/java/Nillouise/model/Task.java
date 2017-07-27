package Nillouise.model;

import java.util.Date;
import java.util.List;

/**
 * Created by win7x64 on 2017/7/27.
 */
public class Task
{


    public int getUserid()
    {
        return userid;
    }

    public void setUserid(int userid)
    {
        this.userid = userid;
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public Date getCreateTime()
    {
        return createTime;
    }

    public void setCreateTime(Date createTime)
    {
        this.createTime = createTime;
    }

    public int getMindEnergy()
    {
        return costMindEnergy;
    }

    public void setMindEnergy(int costMindEnergy)
    {
        this.costMindEnergy = costMindEnergy;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getContent()
    {
        return content;
    }

    public void setContent(String content)
    {
        this.content = content;
    }

    public List<Tag> getTags()
    {
        return tags;
    }

    public void setTags(List<Tag> tags)
    {
        this.tags = tags;
    }

    public int userid;
    public int id;
    public Date createTime=new Date();
    public int costMindEnergy;
    public String title="";
    public String content="";
    public List<Tag> tags;

}
