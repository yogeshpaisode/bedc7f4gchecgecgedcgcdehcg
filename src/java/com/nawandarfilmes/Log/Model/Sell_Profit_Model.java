/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nawandarfilmes.Log.Model;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author yogesh
 */
public class Sell_Profit_Model extends org.apache.struts.action.ActionForm {

    private String date = "";
    private String wo_id = "";
    private String ticket = "";
    private String gross = "";
    private String nett = "";
    private String edtax = "";

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getEdtax() {
        return edtax;
    }

    public void setEdtax(String edtax) {
        this.edtax = edtax;
    }

    public String getGross() {
        return gross;
    }

    public void setGross(String gross) {
        this.gross = gross;
    }

    public String getNett() {
        return nett;
    }

    public void setNett(String nett) {
        this.nett = nett;
    }

    public String getTicket() {
        return ticket;
    }

    public void setTicket(String ticket) {
        this.ticket = ticket;
    }

    public String getWo_id() {
        return wo_id;
    }

    public void setWo_id(String wo_id) {
        this.wo_id = wo_id;
    }

    /**
     *
     */
    public Sell_Profit_Model() {
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
