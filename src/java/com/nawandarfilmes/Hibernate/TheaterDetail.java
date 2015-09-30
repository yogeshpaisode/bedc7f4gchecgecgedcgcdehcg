package com.nawandarfilmes.Hibernate;
// Generated Sep 19, 2015 2:44:42 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TheaterDetail generated by hbm2java
 */
public class TheaterDetail  implements java.io.Serializable {


     private Integer TId;
     private PartyDetail partyDetail;
     private String TName;
     private String TAddress;
     private String TState;
     private String TCity;
     private String TCountry;
     private String TEmail;
     private Integer TStdCode;
     private String TPhoneNumber;
     private String TType;
     private Date TDatetimeAddition;
     private Integer TNoScreens;
     private Set<WorkOrder> workOrders = new HashSet<WorkOrder>(0);
     private Set<ScreenDetail> screenDetails = new HashSet<ScreenDetail>(0);

    public TheaterDetail() {
    }

    public TheaterDetail(PartyDetail partyDetail, String TName, String TAddress, String TState, String TCity, String TCountry, String TEmail, Integer TStdCode, String TPhoneNumber, String TType, Date TDatetimeAddition, Integer TNoScreens, Set<WorkOrder> workOrders, Set<ScreenDetail> screenDetails) {
       this.partyDetail = partyDetail;
       this.TName = TName;
       this.TAddress = TAddress;
       this.TState = TState;
       this.TCity = TCity;
       this.TCountry = TCountry;
       this.TEmail = TEmail;
       this.TStdCode = TStdCode;
       this.TPhoneNumber = TPhoneNumber;
       this.TType = TType;
       this.TDatetimeAddition = TDatetimeAddition;
       this.TNoScreens = TNoScreens;
       this.workOrders = workOrders;
       this.screenDetails = screenDetails;
    }
   
    public Integer getTId() {
        return this.TId;
    }
    
    public void setTId(Integer TId) {
        this.TId = TId;
    }
    public PartyDetail getPartyDetail() {
        return this.partyDetail;
    }
    
    public void setPartyDetail(PartyDetail partyDetail) {
        this.partyDetail = partyDetail;
    }
    public String getTName() {
        return this.TName;
    }
    
    public void setTName(String TName) {
        this.TName = TName;
    }
    public String getTAddress() {
        return this.TAddress;
    }
    
    public void setTAddress(String TAddress) {
        this.TAddress = TAddress;
    }
    public String getTState() {
        return this.TState;
    }
    
    public void setTState(String TState) {
        this.TState = TState;
    }
    public String getTCity() {
        return this.TCity;
    }
    
    public void setTCity(String TCity) {
        this.TCity = TCity;
    }
    public String getTCountry() {
        return this.TCountry;
    }
    
    public void setTCountry(String TCountry) {
        this.TCountry = TCountry;
    }
    public String getTEmail() {
        return this.TEmail;
    }
    
    public void setTEmail(String TEmail) {
        this.TEmail = TEmail;
    }
    public Integer getTStdCode() {
        return this.TStdCode;
    }
    
    public void setTStdCode(Integer TStdCode) {
        this.TStdCode = TStdCode;
    }
    public String getTPhoneNumber() {
        return this.TPhoneNumber;
    }
    
    public void setTPhoneNumber(String TPhoneNumber) {
        this.TPhoneNumber = TPhoneNumber;
    }
    public String getTType() {
        return this.TType;
    }
    
    public void setTType(String TType) {
        this.TType = TType;
    }
    public Date getTDatetimeAddition() {
        return this.TDatetimeAddition;
    }
    
    public void setTDatetimeAddition(Date TDatetimeAddition) {
        this.TDatetimeAddition = TDatetimeAddition;
    }
    public Integer getTNoScreens() {
        return this.TNoScreens;
    }
    
    public void setTNoScreens(Integer TNoScreens) {
        this.TNoScreens = TNoScreens;
    }
    public Set<WorkOrder> getWorkOrders() {
        return this.workOrders;
    }
    
    public void setWorkOrders(Set<WorkOrder> workOrders) {
        this.workOrders = workOrders;
    }
    public Set<ScreenDetail> getScreenDetails() {
        return this.screenDetails;
    }
    
    public void setScreenDetails(Set<ScreenDetail> screenDetails) {
        this.screenDetails = screenDetails;
    }




}

