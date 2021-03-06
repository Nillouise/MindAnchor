package Nillouise.model;

import Nillouise.service.TagItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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

    public int getBlock()
    {
        return block;
    }

    public void setBlock(int block)
    {
        this.block = block;
    }

    public String getTagsstring()
    {
        if(tags==null)
        {
            return "";
        }else {
            String r ="";
            for(Tag tag:tags)
            {
                r+=tag.title+";";
            }
            return r.trim();
        }
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
    //0代表正常，1代表被删除了，其他数字待定，通常是service层才用到这个字段
    public int block=0;

}
