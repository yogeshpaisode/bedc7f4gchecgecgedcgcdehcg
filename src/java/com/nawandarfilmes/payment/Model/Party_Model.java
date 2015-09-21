/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nawandarfilmes.payment.Model;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author yogesh
 */
public class Party_Model extends org.apache.struts.action.ActionForm {
    
   private String payment="";
   private String amt_recv="";
   private String date="";
   private String time="";
   private String utr="";
   private String cheq_no="";
   private String depo_name="";
   private String bank="";
   private String wo_id="";

    public String getWo_id() {
        return wo_id;
    }

    public void setWo_id(String wo_id) {
        this.wo_id = wo_id;
    }
    public String getAmt_recv() {
        return amt_recv;
    }

    public void setAmt_recv(String amt_recv) {
        this.amt_recv = amt_recv;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getCheq_no() {
        return cheq_no;
    }

    public void setCheq_no(String cheq_no) {
        this.cheq_no = cheq_no;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDepo_name() {
        return depo_name;
    }

    public void setDepo_name(String depo_name) {
        this.depo_name = depo_name;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getUtr() {
        return utr;
    }

    public void setUtr(String utr) {
        this.utr = utr;
    }
   

    /**
     *
     */
    public Party_Model() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
//        if (getName() == null || getName().length() < 1) {
//            errors.add("name", new ActionMessage("error.name.required"));
//            // TODO: add 'error.name.required' key to your resources
//        }
        return errors;
    }
}
