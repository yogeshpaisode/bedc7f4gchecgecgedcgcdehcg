package com.nawandarfilmes.Hibernate;
// Generated Oct 8, 2015 3:47:50 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * PartyDetail generated by hbm2java
 */
public class PartyDetail  implements java.io.Serializable {


     private Integer PId;
     private String PName;
     private String PEmail;
     private String PPassword;
     private Integer PStdCode;
     private String POfficeNumber;
     private String PAddress;
     private String PState;
     private String PCity;
     private String PFax;
     private String PCountry;
     private String PCircuit;
     private String PCircuitRegion;
     private Date PDatetimeAddition;
     private Set<WorkOrder> workOrders = new HashSet<WorkOrder>(0);
     private Set<MembersDetail> membersDetails = new HashSet<MembersDetail>(0);
     private Set<ScreenDetail> screenDetails = new HashSet<ScreenDetail>(0);
     private Set<TheaterDetail> theaterDetails = new HashSet<TheaterDetail>(0);

    public PartyDetail() {
    }

    public PartyDetail(String PName, String PEmail, String PPassword, Integer PStdCode, String POfficeNumber, String PAddress, String PState, String PCity, String PFax, String PCountry, String PCircuit, String PCircuitRegion, Date PDatetimeAddition, Set<WorkOrder> workOrders, Set<MembersDetail> membersDetails, Set<ScreenDetail> screenDetails, Set<TheaterDetail> theaterDetails) {
       this.PName = PName;
       this.PEmail = PEmail;
       this.PPassword = PPassword;
       this.PStdCode = PStdCode;
       this.POfficeNumber = POfficeNumber;
       this.PAddress = PAddress;
       this.PState = PState;
       this.PCity = PCity;
       this.PFax = PFax;
       this.PCountry = PCountry;
       this.PCircuit = PCircuit;
       this.PCircuitRegion = PCircuitRegion;
       this.PDatetimeAddition = PDatetimeAddition;
       this.workOrders = workOrders;
       this.membersDetails = membersDetails;
       this.screenDetails = screenDetails;
       this.theaterDetails = theaterDetails;
    }
   
    public Integer getPId() {
        return this.PId;
    }
    
    public void setPId(Integer PId) {
        this.PId = PId;
    }
    public String getPName() {
        return this.PName;
    }
    
    public void setPName(String PName) {
        this.PName = PName;
    }
    public String getPEmail() {
        return this.PEmail;
    }
    
    public void setPEmail(String PEmail) {
        this.PEmail = PEmail;
    }
    public String getPPassword() {
        return this.PPassword;
    }
    
    public void setPPassword(String PPassword) {
        this.PPassword = PPassword;
    }
    public Integer getPStdCode() {
        return this.PStdCode;
    }
    
    public void setPStdCode(Integer PStdCode) {
        this.PStdCode = PStdCode;
    }
    public String getPOfficeNumber() {
        return this.POfficeNumber;
    }
    
    public void setPOfficeNumber(String POfficeNumber) {
        this.POfficeNumber = POfficeNumber;
    }
    public String getPAddress() {
        return this.PAddress;
    }
    
    public void setPAddress(String PAddress) {
        this.PAddress = PAddress;
    }
    public String getPState() {
        return this.PState;
    }
    
    public void setPState(String PState) {
        this.PState = PState;
    }
    public String getPCity() {
        return this.PCity;
    }
    
    public void setPCity(String PCity) {
        this.PCity = PCity;
    }
    public String getPFax() {
        return this.PFax;
    }
    
    public void setPFax(String PFax) {
        this.PFax = PFax;
    }
    public String getPCountry() {
        return this.PCountry;
    }
    
    public void setPCountry(String PCountry) {
        this.PCountry = PCountry;
    }
    public String getPCircuit() {
        return this.PCircuit;
    }
    
    public void setPCircuit(String PCircuit) {
        this.PCircuit = PCircuit;
    }
    public String getPCircuitRegion() {
        return this.PCircuitRegion;
    }
    
    public void setPCircuitRegion(String PCircuitRegion) {
        this.PCircuitRegion = PCircuitRegion;
    }
    public Date getPDatetimeAddition() {
        return this.PDatetimeAddition;
    }
    
    public void setPDatetimeAddition(Date PDatetimeAddition) {
        this.PDatetimeAddition = PDatetimeAddition;
    }
    public Set<WorkOrder> getWorkOrders() {
        return this.workOrders;
    }
    
    public void setWorkOrders(Set<WorkOrder> workOrders) {
        this.workOrders = workOrders;
    }
    public Set<MembersDetail> getMembersDetails() {
        return this.membersDetails;
    }
    
    public void setMembersDetails(Set<MembersDetail> membersDetails) {
        this.membersDetails = membersDetails;
    }
    public Set<ScreenDetail> getScreenDetails() {
        return this.screenDetails;
    }
    
    public void setScreenDetails(Set<ScreenDetail> screenDetails) {
        this.screenDetails = screenDetails;
    }
    public Set<TheaterDetail> getTheaterDetails() {
        return this.theaterDetails;
    }
    
    public void setTheaterDetails(Set<TheaterDetail> theaterDetails) {
        this.theaterDetails = theaterDetails;
    }




}


