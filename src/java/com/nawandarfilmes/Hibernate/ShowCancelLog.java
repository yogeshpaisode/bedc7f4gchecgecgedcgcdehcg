package com.nawandarfilmes.Hibernate;
// Generated Oct 8, 2015 3:47:50 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * ShowCancelLog generated by hbm2java
 */
public class ShowCancelLog  implements java.io.Serializable {


     private Integer scId;
     private WoAgrrement woAgrrement;
     private Date logDate;
     private Double amountDeducted;

    public ShowCancelLog() {
    }

    public ShowCancelLog(WoAgrrement woAgrrement, Date logDate, Double amountDeducted) {
       this.woAgrrement = woAgrrement;
       this.logDate = logDate;
       this.amountDeducted = amountDeducted;
    }
   
    public Integer getScId() {
        return this.scId;
    }
    
    public void setScId(Integer scId) {
        this.scId = scId;
    }
    public WoAgrrement getWoAgrrement() {
        return this.woAgrrement;
    }
    
    public void setWoAgrrement(WoAgrrement woAgrrement) {
        this.woAgrrement = woAgrrement;
    }
    public Date getLogDate() {
        return this.logDate;
    }
    
    public void setLogDate(Date logDate) {
        this.logDate = logDate;
    }
    public Double getAmountDeducted() {
        return this.amountDeducted;
    }
    
    public void setAmountDeducted(Double amountDeducted) {
        this.amountDeducted = amountDeducted;
    }




}


