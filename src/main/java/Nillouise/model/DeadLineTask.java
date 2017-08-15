package Nillouise.model;

import java.util.Date;

/**
 * Created by win7x64 on 2017/8/14.
 */
public class DeadLineTask extends Task
{
    public Date getDeadline()
    {
        return deadline;
    }

    public void setDeadline(Date deadline)
    {
        this.deadline = deadline;
    }

    Date deadline = new Date();

}
