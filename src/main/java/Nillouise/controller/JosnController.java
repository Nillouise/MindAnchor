package Nillouise.controller;

import Nillouise.model.Task;
import Nillouise.service.TaskService;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by win7x64 on 2017/8/17.
 */


@Controller
@RequestMapping("/json")
public class JosnController
{
    private static final Logger LOGGER = LoggerFactory.getLogger(JosnController.class);
    @Autowired
    private TaskService taskService;

    @RequestMapping(value = "/requesttaskinfo",method = RequestMethod.POST)
    public void setJson(@RequestBody RecevieJson json, HttpServletResponse response)throws Exception
    {
        List<Task> returnJson = new ArrayList<Task>();
        if(json!=null)
        {
            for (int i=0;i<json.getTaskid().length;i++)
            {
                Task task = taskService.select(json.getTaskid()[i]);
                returnJson.add(task);
            }
        }

        ObjectMapper mapper = new ObjectMapper();
        LOGGER.info("传过来的id: "+mapper.writeValueAsString(json));
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println(mapper.writeValueAsString(returnJson));
    }

    @RequestMapping(value="/channel",produces="application/json;charset=UTF-8")
    @ResponseBody
    public SchoolBannerInfo ceshijson(@RequestBody SchoolBannerInfo schoolBannerInfo) throws IOException
    {
//      Map<String,Object> map = new HashMap<String,Object>();
//       map.put("channelId", channelId);
//       ObjectMapper mapper = new ObjectMapper();
//       channelId = mapper.writeValueAsString(map);
        return schoolBannerInfo;
    }

    @RequestMapping(value="{name}", method = RequestMethod.GET)
    public @ResponseBody Shop getShopInJSON(@PathVariable String name) {

        Shop shop = new Shop();
        shop.setName(name);
        shop.setStaffName(new String[]{"mkyong1", "mkyong2"});

        return shop;
    }

}


class Shop {

    String name;
    String staffName[];

    //getter and setter methods


    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String[] getStaffName()
    {
        return staffName;
    }

    public void setStaffName(String[] staffName)
    {
        this.staffName = staffName;
    }
}

class SchoolBannerInfo {
    private Integer id;

    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
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

    public String getImg()
    {
        return img;
    }

    public void setImg(String img)
    {
        this.img = img;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getInfo()
    {
        return info;
    }

    public void setInfo(String info)
    {
        this.info = info;
    }

    public Integer getSeq()
    {
        return seq;
    }

    public void setSeq(Integer seq)
    {
        this.seq = seq;
    }

    public Integer getSchoolId()
    {
        return schoolId;
    }

    public void setSchoolId(Integer schoolId)
    {
        this.schoolId = schoolId;
    }

    public String getType()
    {
        return type;
    }

    public void setType(String type)
    {
        this.type = type;
    }

    public boolean isEnable()
    {
        return enable;
    }

    public void setEnable(boolean enable)
    {
        this.enable = enable;
    }

    public String getLink()
    {
        return link;
    }

    public void setLink(String link)
    {
        this.link = link;
    }

    public String getChannelId()
    {
        return channelId;
    }

    public void setChannelId(String channelId)
    {
        this.channelId = channelId;
    }

    private Date createTime;
    private String img;
    private String title;
    private String info;
    private Integer seq;
    private Integer schoolId;
    private String type;
    private boolean enable;
    private String link;
    private String channelId;
}

class RecevieJson
{
    public Integer[] getTaskid()
    {
        return taskid;
    }

    public void setTaskid(Integer[] taskid)
    {
        this.taskid = taskid;
    }

    Integer []taskid;
}
