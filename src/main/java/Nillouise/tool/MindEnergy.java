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
    private int maxmindenergy=100000;
    public MindEnergy(Date pretime,int preMindEnergy)
    {
        this(pretime,preMindEnergy,100000);
    }

    public MindEnergy(Date pretime,int preMindEnergy,int maxMindEnergy)
    {
        this.maxmindenergy = maxMindEnergy;

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

        //把体力值设为最大10000
        if(this.curmindenergy>maxMindEnergy)
        {
            this.curmindenergy = maxMindEnergy;
        }
        if(this.preMindEnergy>maxMindEnergy)
        {
            this.preMindEnergy = maxMindEnergy;
        }
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
