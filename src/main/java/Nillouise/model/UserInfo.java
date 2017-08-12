package Nillouise.model;

import Nillouise.tool.MindEnergy;
import Nillouise.variable.StringConstant;
import org.joda.time.Instant;
import org.joda.time.Interval;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by win7x64 on 2017/7/21.
 */
public class UserInfo
{
    public UserInfo()
    {
        id=0;
        username="";
        password="";
        createtime = new Date();
        MindEnergy mindEnergy = new MindEnergy(new Date(),premindenergy);
        premindenergytime = mindEnergy.getLasttime();
        maxmindenergy = StringConstant.initMaxMindEnergy;
        premindenergy = maxmindenergy;
    }

    public boolean copyFrom(UserInfo source)
    {
        this.id = source.id;
        this.username = source.username;
        this.password = source.password;
        this.createtime = source.createtime;
        this.premindenergy=source.premindenergy;
        this.premindenergytime=source.premindenergytime;
        this.maxmindenergy=source.maxmindenergy;
        return true;
    }

    public boolean copyFrom(LoginForm source)
    {
        this.username = source.getUsername();
        this.password = source.getPassword();
        return true;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public Date getCreatetime()
    {
        return createtime;
    }

    public void setCreatetime(Date createtime)
    {
        this.createtime = createtime;
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public int getPremindenergy()
    {
        return premindenergy;
    }

    public void setPremindenergy(int premindenergy)
    {
        this.premindenergy = premindenergy;
    }

    public Date getPremindenergytime()
    {
        return premindenergytime;
    }

    public void setPremindenergytime(Date premindenergytime)
    {
        this.premindenergytime = premindenergytime;
    }

    public int getMaxmindenergy()
    {
        return maxmindenergy;
    }

    public void setMaxmindenergy(int maxmindenergy)
    {
        this.maxmindenergy = maxmindenergy;
    }


    @Override
    public String toString()
    {
        return getUsername()+" "+getPassword();
    }

    //获得当前应该有多少MindEnergy，并会自动修改校准时间和当前MindEnergy
    public int getCurmindenergy()
    {
        MindEnergy mindEnergy = new MindEnergy(premindenergytime,premindenergy,maxmindenergy);
        premindenergytime = mindEnergy.getLasttime();
        premindenergy = mindEnergy.getCurmindenergy();

        return premindenergy;
    }

    //消耗MindEnergy，成功返回true，失败返回false
    public boolean subCurmindenergy(int substract)
    {
        if(premindenergy-substract<0)
        {
            return false;
        }
        premindenergy-=substract;
        return true;
    }

    private int id;
    private String username;
    private String password;
    private Date createtime;

    private int premindenergy;
    private Date premindenergytime;

    private int maxmindenergy;

}
