/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nawandarfilmes.commonUtility;
import com.nawandarfilmes.Hibernate.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author yogesh
 */
public class Common {

    private double mg_net_amount = 0;
    private boolean flag=true;
   
    public int getDays(Date to, Date from) {
        return (int) ((to.getTime() - from.getTime()) / (1000 * 60 * 60 * 24)) + 1;
    }

    public String getZeros(int id) {

        String zero = "";

        if (id <= 9) {
            zero = "000";
        } else if (id > 9 && id <= 99) {
            zero = "00";
        } else if (id > 99 && id < 999) {
            zero = "0";
        } else {
            zero = "";
        }

        return zero;
    }

    public String formateDate(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
        return sdf.format(date);
    }
     public String formateDate_yyyy_MM_dd(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }

    public boolean checkAggrement(Date from, Date to, Date on) {
        boolean flag = false;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date from_Date = from;
        Date to_Date = to;
        Date on_Date = on;
        if (on_Date.equals(from_Date) || on_Date.equals(to_Date) || (on_Date.after(from_Date) && on_Date.before(to_Date))) {
            flag = true;
        }
        return flag;
    }

    private double getDistributerShare(double dis_Share, double total_rent, double nett_Amount, boolean per_day_flag, int days) {
        double rent = total_rent;
        if (per_day_flag == true) {
            rent = (rent / days);
        }
        double amount = nett_Amount - rent;
        if (amount > 0) {
            amount = (dis_Share / 100) * amount;
        } else {
            amount = 0;
        }
        return amount;
    }

    private double getDistributerRent(double total_rent, double nett_Amount, boolean per_day_flag, int days) {
        double amount = 0;
        double rent = total_rent;
        if (per_day_flag == true) {
            rent = (rent / days);
        }
        amount = nett_Amount - rent;
        if (amount <= 0) {
            amount = 0;
        }
        return amount;
    }

    private double getDistributerMG(double dis_Share, double total_rent, double nett_Amount, boolean per_day_flag, int days, double mg_amount) {
        double amount = 0;
        mg_net_amount = mg_net_amount + nett_Amount;
        if (mg_net_amount > mg_amount) {
            if(flag){
                nett_Amount=mg_net_amount-mg_amount;
                flag=false;
            }
            double rent = total_rent;
            if (per_day_flag == true) {
                rent = (rent / days);
            }
            amount = nett_Amount - rent;
            if (amount > 0) {
                amount = (dis_Share / 100) * amount;
            } else {
                amount = 0;
            }
        }//--Main IF
        return amount;
    }

    public double getDistributerProfit(boolean rent_flag, boolean share_flag, boolean mg_flag, double total_rent, double dis_Share, double mg_amount, double nett_Amount, boolean per_day_flag, int days) {
        double amount = 0;

        if (rent_flag) {
            amount = getDistributerRent(total_rent, nett_Amount, per_day_flag, days);
        }
        if (share_flag) {
            amount = getDistributerShare(dis_Share, total_rent, nett_Amount, per_day_flag, days);
        }
        if(mg_flag){
            amount=getDistributerMG(dis_Share, total_rent, nett_Amount, per_day_flag, days, mg_amount);
        }
        return amount;
    }
    public double getPaymentReceived(WorkOrder wo){
        double amount=0;
        SessionFactory sessionFactory=HibernateUtil.getSessionFactory();
        Session session=sessionFactory.openSession();
        Criteria cash_criteria=session.createCriteria(CashPayment.class);
        cash_criteria.add(Restrictions.eq("workOrder", wo));
        for(Object cash_obj:cash_criteria.list()){
            CashPayment cp=(CashPayment) cash_obj;
            amount=amount+cp.getAmtRecv();
        }
        Criteria nr_criteria=session.createCriteria(NeftRtgsPayment.class);
        nr_criteria.add(Restrictions.eq("workOrder", wo));
        for(Object nr_obj:nr_criteria.list()){
            NeftRtgsPayment nr=(NeftRtgsPayment) nr_obj;
            amount=amount+nr.getAmtRecv();
        }
        Criteria cheque_criteria=session.createCriteria(CheaquePayment.class);
        cheque_criteria.add(Restrictions.eq("workOrder", wo));
        for(Object cheque_obj:cheque_criteria.list()){
            CheaquePayment cp=(CheaquePayment) cheque_obj;
            amount=amount+cp.getAmtRecv();
        }
        session.close();
        return amount;
    }
}
