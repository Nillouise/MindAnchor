package Nillouise.model;

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
    }



    public boolean copyFrom(UserInfo source)
    {
        this.id = source.id;
        this.username = source.username;
        this.password = source.password;
        this.createtime = source.createtime;
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

    @Override
    public String toString()
    {
        return getUsername()+" "+getPassword();
    }

    private int id;
    private String username;
    private String password;
    private Date createtime;


}
