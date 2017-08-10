package Nillouise.model;

import java.util.Date;

/**
 * Created by win7x64 on 2017/7/27.
 */
public class Tag
{
    public Tag()
    {
        createtime = new Date();
    }

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

    public Date getCreatetime()
    {
        return createtime;
    }

    public void setCreatetime(Date createtime)
    {
        this.createtime = createtime;
    }

    @Override
    public String toString()
    {
        return title+" "+content;
    }

    int id;
    int userid;
    String title;
    String content;
    Date createtime;

}
