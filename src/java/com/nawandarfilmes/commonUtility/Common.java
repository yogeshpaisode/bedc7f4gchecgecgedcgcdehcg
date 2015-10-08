/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nawandarfilmes.commonUtility;

import com.nawandarfilmes.Hibernate.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author yogesh
 */
public class Common {
    
    private double mg_net_amount = 0;
    private boolean flag = true;
    private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
    private Date end_Date = null;
    Calendar c = Calendar.getInstance();
    
    public int getDays(Date to, Date from) {
        return (int) ((to.getTime() - from.getTime()) / (1000 * 60 * 60 * 24)) + 1;
    }
    
    public int getMovie_ID() {
        int mov_id = 0;
        Session session = sessionFactory.openSession();
        Criteria criteria = session.createCriteria(MovieDetail.class);
        for (Object o : criteria.list()) {
            MovieDetail md = (MovieDetail) o;
            mov_id = md.getMovId();
        }
        session.close();
        return mov_id;
    }
    
    public Date get_Last_End_Date(int mov_id) {
        c.set(2014, 1, 1);
        end_Date = c.getTime();
        Session session = sessionFactory.openSession();
        Criteria criteria = session.createCriteria(MovieDetail.class);
        criteria.add(Restrictions.eq("movId", mov_id));
        MovieDetail md = (MovieDetail) criteria.list().get(0);
        criteria = session.createCriteria(WorkOrder.class);
        criteria.add(Restrictions.eq("movieDetail", md));
        for (Object o : criteria.list()) {
            WorkOrder wo = (WorkOrder) o;
            if (wo.getWoEndDate().after(end_Date)) {
                end_Date = wo.getWoEndDate();
            }
        }
        session.close();
        return end_Date;
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
    
    public String getDayName(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("EEE");
        return sdf.format(date);
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
            if (flag) {
                nett_Amount = mg_net_amount - mg_amount;
                flag = false;
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
        if (mg_flag) {
            amount = getDistributerMG(dis_Share, total_rent, nett_Amount, per_day_flag, days, mg_amount);
        }
        return amount;
    }
    
    public double getPaymentReceived(WorkOrder wo) {
        double amount = 0;
        Session session = sessionFactory.openSession();
        Criteria cash_criteria = session.createCriteria(CashPayment.class);
        cash_criteria.add(Restrictions.eq("workOrder", wo));
        for (Object cash_obj : cash_criteria.list()) {
            CashPayment cp = (CashPayment) cash_obj;
            amount = amount + cp.getAmtRecv();
        }
        Criteria nr_criteria = session.createCriteria(NeftRtgsPayment.class);
        nr_criteria.add(Restrictions.eq("workOrder", wo));
        for (Object nr_obj : nr_criteria.list()) {
            NeftRtgsPayment nr = (NeftRtgsPayment) nr_obj;
            amount = amount + nr.getAmtRecv();
        }
        Criteria cheque_criteria = session.createCriteria(CheaquePayment.class);
        cheque_criteria.add(Restrictions.eq("workOrder", wo));
        for (Object cheque_obj : cheque_criteria.list()) {
            CheaquePayment cp = (CheaquePayment) cheque_obj;
            amount = amount + cp.getAmtRecv();
        }
        session.close();
        return amount;
    }
    
    public void deductRent(int deduction, WorkOrder wo, Date log_Date) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Criteria criteria = session.createCriteria(WoAgrrement.class);
        criteria.add(Restrictions.eq("workOrder", wo));
        for (Object o : criteria.list()) {
            WoAgrrement wa = (WoAgrrement) o;
            if (log_Date.equals(wa.getStartDate()) || log_Date.after(wa.getStartDate()) || log_Date.equals(wa.getEndDate()) || log_Date.before(wa.getEndDate())) {
                System.out.println("\n\n\n" + wa.getTheaterRent() + "  " + wo.getWoShowsPerDay() * getDays(wa.getEndDate(), wa.getStartDate()) + "\n\n\n");
                double amt = (wa.getTheaterRent() / (wo.getWoShowsPerDay() * getDays(wa.getEndDate(), wa.getStartDate()))) * deduction;
                ShowCancelLog log = new ShowCancelLog(wa, log_Date, amt);
                session.save(log);
                transaction.commit();
                break;
            }
        }
        session.close();
    }
    
    public double getDeducedRent(WoAgrrement wa) {
        double amt = 0;
        Session session = sessionFactory.openSession();
        
        Criteria criteria = session.createCriteria(ShowCancelLog.class);
        criteria.add(Restrictions.eq("woAgrrement", wa));
        
        for (Object o : criteria.list()) {
            amt += ((ShowCancelLog) o).getAmountDeducted();
        }
        session.close();
        return amt;
    }
    
    public List getMovieList() {
        List list = new ArrayList();
        Session session = sessionFactory.openSession();        
        Criteria criteria = session.createCriteria(MovieDetail.class);
        for (Object o : criteria.list()) {
            MovieDetail md = (MovieDetail) o;
            list.add(md.getMovName());
        }
        session.close();
        return list;
    }
}
