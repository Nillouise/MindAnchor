package Nillouise.tool;

import Nillouise.variable.StringConstant;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by win7x64 on 2017/7/29.
 */
public class MindEnergy
{
    private Date pretime;
    private int preMindEnergy;
    private Date curtime;
    private int curmindenergy;
    public MindEnergy(Date pretime,int preMindEnergy)
    {
        this.pretime = pretime;
        this.preMindEnergy = preMindEnergy;

        Calendar c = Calendar.getInstance();
        Date curdate = c.getTime();
        long interval = curdate.getTime()-pretime.getTime();
        long addMindEnergy = interval/(1000*60* StringConstant.minutesAMindEnergy);

        this.curmindenergy += preMindEnergy + addMindEnergy;
        int curminute = c.get(Calendar.MINUTE);
        curminute -= curminute%StringConstant.minutesAMindEnergy;
        c.set(Calendar.MINUTE,curminute);
        c.set(Calendar.SECOND,0);
        this.curtime = c.getTime();
    }
    public int getCurmindenergy()
    {
        return curmindenergy;
    }
    public Date getLasttime()
    {
        return curtime;
    }
}
