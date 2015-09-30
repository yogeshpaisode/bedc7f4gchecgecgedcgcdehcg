/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nawandarfilmes.workorder.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author yogesh
 */
public class Add_Workorder_Model extends org.apache.struts.action.ActionForm {

    private String p_id = "";
    private String woSentEmail = "";
    private String shows_per_day = "";

    public String getShows_per_day() {
        return shows_per_day;
    }

    public void setShows_per_day(String shows_per_day) {
        this.shows_per_day = shows_per_day;
    }

    public String getWoSentEmail() {
        return woSentEmail;
    }

    public void setWoSentEmail(String woSentEmail) {
        this.woSentEmail = woSentEmail;
    }
    private String t_id = "";
    private String s_id = "";
    private String mov_id = "";
    private String start_date = "";
    private String end_date = "";

    public String getD_1() {
        return d_1;
    }

    public void setD_1(String d_1) {
        this.d_1 = d_1;
    }

    public String getD_2() {
        return d_2;
    }

    public void setD_2(String d_2) {
        this.d_2 = d_2;
    }

    public String getD_3() {
        return d_3;
    }

    public void setD_3(String d_3) {
        this.d_3 = d_3;
    }

    public String getD_4() {
        return d_4;
    }

    public void setD_4(String d_4) {
        this.d_4 = d_4;
    }

    public String getD_5() {
        return d_5;
    }

    public void setD_5(String d_5) {
        this.d_5 = d_5;
    }

    public String getD_6() {
        return d_6;
    }

    public void setD_6(String d_6) {
        this.d_6 = d_6;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }
    private String d_1 = "";
    private String d_2 = "";
    private String d_3 = "";
    private String d_4 = "";
    private String d_5 = "";
    private String d_6 = "";
    private String t1_rent = "";
    private String t2_rent = "";
    private String t3_rent = "";
    private String t4_rent = "";
    private String t5_rent = "";
    private String t6_rent = "";
    private String distr1_share = "";
    private String distr2_share = "";
    private String distr3_share = "";
    private String distr4_share = "";
    private String distr5_share = "";
    private String distr6_share = "";
    private String owner1_share = "";
    private String owner2_share = "";
    private String owner3_share = "";
    private String owner4_share = "";
    private String owner5_share = "";
    private String owner6_share = "";
    private String wo_type = "";
    private String mg_amount = "";
    private String payment_Method = "";
    private String utr_no = "";
    private String cheaque_no = "";
    private String bank_name = "";
    private String depositor_name = "";
    private String amount_recv = "";
    private String amount_recv_date = "";
    private String amount_recv_time = "";

    public String getAmount_recv() {
        return amount_recv;
    }

    public void setAmount_recv(String amount_recv) {
        this.amount_recv = amount_recv;
    }

    public String getAmount_recv_date() {
        return amount_recv_date;
    }

    public void setAmount_recv_date(String amount_recv_date) {
        this.amount_recv_date = amount_recv_date;
    }

    public String getAmount_recv_time() {
        return amount_recv_time;
    }

    public void setAmount_recv_time(String amount_recv_time) {
        this.amount_recv_time = amount_recv_time;
    }

    public String getBank_name() {
        return bank_name;
    }

    public void setBank_name(String bank_name) {
        this.bank_name = bank_name;
    }

    public String getCheaque_no() {
        return cheaque_no;
    }

    public void setCheaque_no(String cheaque_no) {
        this.cheaque_no = cheaque_no;
    }

    public String getDepositor_name() {
        return depositor_name;
    }

    public void setDepositor_name(String depositor_name) {
        this.depositor_name = depositor_name;
    }

    public String getDistr1_share() {
        return distr1_share;
    }

    public void setDistr1_share(String distr1_share) {
        this.distr1_share = distr1_share;
    }

    public String getDistr2_share() {
        return distr2_share;
    }

    public void setDistr2_share(String distr2_share) {
        this.distr2_share = distr2_share;
    }

    public String getDistr3_share() {
        return distr3_share;
    }

    public void setDistr3_share(String distr3_share) {
        this.distr3_share = distr3_share;
    }

    public String getDistr4_share() {
        return distr4_share;
    }

    public void setDistr4_share(String distr4_share) {
        this.distr4_share = distr4_share;
    }

    public String getDistr5_share() {
        return distr5_share;
    }

    public void setDistr5_share(String distr5_share) {
        this.distr5_share = distr5_share;
    }

    public String getDistr6_share() {
        return distr6_share;
    }

    public void setDistr6_share(String distr6_share) {
        this.distr6_share = distr6_share;
    }

    public String getMg_amount() {
        return mg_amount;
    }

    public void setMg_amount(String mg_amount) {
        this.mg_amount = mg_amount;
    }

    public String getMov_id() {
        return mov_id;
    }

    public void setMov_id(String mov_id) {
        this.mov_id = mov_id;
    }

    public String getOwner1_share() {
        return owner1_share;
    }

    public void setOwner1_share(String owner1_share) {
        this.owner1_share = owner1_share;
    }

    public String getOwner2_share() {
        return owner2_share;
    }

    public void setOwner2_share(String owner2_share) {
        this.owner2_share = owner2_share;
    }

    public String getOwner3_share() {
        return owner3_share;
    }

    public void setOwner3_share(String owner3_share) {
        this.owner3_share = owner3_share;
    }

    public String getOwner4_share() {
        return owner4_share;
    }

    public void setOwner4_share(String owner4_share) {
        this.owner4_share = owner4_share;
    }

    public String getOwner5_share() {
        return owner5_share;
    }

    public void setOwner5_share(String owner5_share) {
        this.owner5_share = owner5_share;
    }

    public String getOwner6_share() {
        return owner6_share;
    }

    public void setOwner6_share(String owner6_share) {
        this.owner6_share = owner6_share;
    }

    public String getP_id() {
        return p_id;
    }

    public void setP_id(String p_id) {
        this.p_id = p_id;
    }

    public String getPayment_Method() {
        return payment_Method;
    }

    public void setPayment_Method(String payment_Method) {
        this.payment_Method = payment_Method;
    }

    public String getS_id() {
        return s_id;
    }

    public void setS_id(String s_id) {
        this.s_id = s_id;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getT1_rent() {
        return t1_rent;
    }

    public void setT1_rent(String t1_rent) {
        this.t1_rent = t1_rent;
    }

    public String getT2_rent() {
        return t2_rent;
    }

    public void setT2_rent(String t2_rent) {
        this.t2_rent = t2_rent;
    }

    public String getT3_rent() {
        return t3_rent;
    }

    public void setT3_rent(String t3_rent) {
        this.t3_rent = t3_rent;
    }

    public String getT4_rent() {
        return t4_rent;
    }

    public void setT4_rent(String t4_rent) {
        this.t4_rent = t4_rent;
    }

    public String getT5_rent() {
        return t5_rent;
    }

    public void setT5_rent(String t5_rent) {
        this.t5_rent = t5_rent;
    }

    public String getT6_rent() {
        return t6_rent;
    }

    public void setT6_rent(String t6_rent) {
        this.t6_rent = t6_rent;
    }

    public String getT_id() {
        return t_id;
    }

    public void setT_id(String t_id) {
        this.t_id = t_id;
    }

    public String getUtr_no() {
        return utr_no;
    }

    public void setUtr_no(String utr_no) {
        this.utr_no = utr_no;
    }

    public String getWo_type() {
        return wo_type;
    }

    public void setWo_type(String wo_type) {
        this.wo_type = wo_type;
    }

    /**
     *
     */
    public Add_Workorder_Model() {
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
        HttpSession session = request.getSession();
        setP_id(session.getAttribute("p_id").toString());
        setT_id(session.getAttribute("t_id").toString());
        setS_id(session.getAttribute("s_id").toString());
        setMov_id(session.getAttribute("mov_id").toString());
        ActionErrors errors = new ActionErrors();
//        if (getName() == null || getName().length() < 1) {
//            errors.add("name", new ActionMessage("error.name.required"));
//            // TODO: add 'error.name.required' key to your resources
//        }
        return errors;
    }
}
