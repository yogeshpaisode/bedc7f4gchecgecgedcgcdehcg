/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nawandarfilmes.commonUtility;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author yogesh
 */
public class Common {

    
    public int getDays(Date to,Date from){
        return (int)((to.getTime()-from.getTime())/(1000 * 60 * 60 * 24))+1;
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
    
    
    public double getDistributerShare(double dis_Share,double total_rent,double nett_Amount,boolean per_day_flag,int days){
        double rent=total_rent;
        if(per_day_flag==true){
            rent=(rent/days);
        }
        double amount=nett_Amount-rent;
        if(amount>0){
            amount=(dis_Share/100)*amount;
        }
        else{
            amount=0;
        }
        return amount;
    }
    
    public double getDistributerRent(double total_rent,double nett_Amount,boolean per_day_flag,int days){
        double amount=0;
        double rent=total_rent;
        if(per_day_flag==true){
            rent=(rent/days);
        }
        amount=amount-rent;
        if(amount<=0){
            amount=0;
        }
        return amount;
    }
    
    public double getDistributerProfit(boolean rent_flag,boolean share_flag,boolean mg_flag,double total_rent,double dis_Share,double mg_amount,double nett_Amount,boolean per_day_flag,int days){
        double amount=0;
        
        if(rent_flag){
            amount=getDistributerRent(total_rent, nett_Amount,per_day_flag , days);
        }
        
        if(share_flag){
            amount=getDistributerShare(dis_Share, total_rent, nett_Amount, per_day_flag, days);
        }
        return  amount;
    }
}
