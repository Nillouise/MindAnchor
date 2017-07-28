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

    public Date getCreatetime()
    {
        return createtime;
    }

    public void setCreatetime(Date createtime)
    {
        this.createtime = createtime;
    }

    public int getCostmindenergy()
    {
        return costmindenergy;
    }

    public void setCostmindenergy(int costmindenergy)
    {
        this.costmindenergy = costmindenergy;
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

    @Override
    public String toString()
    {
        return title+" "+content;
    }

    public int userid;
    public int id;
    public Date createtime =new Date();


    public int costmindenergy;
    public String title="";
    public String content="";
    public List<Tag> tags;

}
