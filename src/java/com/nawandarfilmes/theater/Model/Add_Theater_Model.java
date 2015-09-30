/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nawandarfilmes.theater.Model;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author yogesh
 */
public class Add_Theater_Model extends org.apache.struts.action.ActionForm {
    
    private String p_id="";

    public String getP_id() {
        return p_id;
    }

    public void setP_id(String p_id) {
        this.p_id = p_id;
    }

    public String getS1_name() {
        return s1_name;
    }

    public void setS1_name(String s1_name) {
        this.s1_name = s1_name;
    }

    public String getS1_number() {
        return s1_number;
    }

    public void setS1_number(String s1_number) {
        this.s1_number = s1_number;
    }

    public String getS1_seats() {
        return s1_seats;
    }

    public void setS1_seats(String s1_seats) {
        this.s1_seats = s1_seats;
    }

    public String getS2_name() {
        return s2_name;
    }

    public void setS2_name(String s2_name) {
        this.s2_name = s2_name;
    }

    public String getS2_number() {
        return s2_number;
    }

    public void setS2_number(String s2_number) {
        this.s2_number = s2_number;
    }

    public String getS2_seats() {
        return s2_seats;
    }

    public void setS2_seats(String s2_seats) {
        this.s2_seats = s2_seats;
    }

    public String getS3_name() {
        return s3_name;
    }

    public void setS3_name(String s3_name) {
        this.s3_name = s3_name;
    }

    public String getS3_number() {
        return s3_number;
    }

    public void setS3_number(String s3_number) {
        this.s3_number = s3_number;
    }

    public String getS3_seats() {
        return s3_seats;
    }

    public void setS3_seats(String s3_seats) {
        this.s3_seats = s3_seats;
    }

    public String getS4_name() {
        return s4_name;
    }

    public void setS4_name(String s4_name) {
        this.s4_name = s4_name;
    }

    public String getS4_number() {
        return s4_number;
    }

    public void setS4_number(String s4_number) {
        this.s4_number = s4_number;
    }

    public String getS4_seats() {
        return s4_seats;
    }

    public void setS4_seats(String s4_seats) {
        this.s4_seats = s4_seats;
    }

    public String getT_address() {
        return t_address;
    }

    public void setT_address(String t_address) {
        this.t_address = t_address;
    }

    public String getT_city() {
        return t_city;
    }

    public void setT_city(String t_city) {
        this.t_city = t_city;
    }

    public String getT_country() {
        return t_country;
    }

    public void setT_country(String t_country) {
        this.t_country = t_country;
    }

    public String getT_email() {
        return t_email;
    }

    public void setT_email(String t_email) {
        this.t_email = t_email;
    }

    public String getT_fax() {
        return t_fax;
    }

    public void setT_fax(String t_fax) {
        this.t_fax = t_fax;
    }

    public String getT_name() {
        return t_name;
    }

    public void setT_name(String t_name) {
        this.t_name = t_name;
    }

    public String getT_no_Screen() {
        return t_no_Screen;
    }

    public void setT_no_Screen(String t_no_Screen) {
        this.t_no_Screen = t_no_Screen;
    }

    public String getT_phone() {
        return t_phone;
    }

    public void setT_phone(String t_phone) {
        this.t_phone = t_phone;
    }

    public String getT_state() {
        return t_state;
    }

    public void setT_state(String t_state) {
        this.t_state = t_state;
    }

    public String getT_std_Code() {
        return t_std_Code;
    }

    public void setT_std_Code(String t_std_Code) {
        this.t_std_Code = t_std_Code;
    }

    public String getT_type() {
        return t_type;
    }

    public void setT_type(String t_type) {
        this.t_type = t_type;
    }
    private String t_name="";
    private String t_address="";
    private String t_city="";
    private String t_state="";
    private String t_country="";
    private String t_email="";
    private String t_std_Code="";
    private String t_phone="";
    private String t_fax="";
    private String t_type="";
    private String t_no_Screen="";
    
    private String s1_name="";
    private String s1_number="";
    private String s1_seats="";
    
    private String s2_name="";
    private String s2_number="";
    private String s2_seats="";
    
    private String s3_name="";
    private String s3_number="";
    private String s3_seats="";
    
    private String s4_name="";
    private String s4_number="";
    private String s4_seats="";
    
    
    private String s5_name="";

    public String getS5_name() {
        return s5_name;
    }

    public void setS5_name(String s5_name) {
        this.s5_name = s5_name;
    }

    public String getS5_number() {
        return s5_number;
    }

    public void setS5_number(String s5_number) {
        this.s5_number = s5_number;
    }

    public String getS5_seats() {
        return s5_seats;
    }

    public void setS5_seats(String s5_seats) {
        this.s5_seats = s5_seats;
    }

    public String getS6_name() {
        return s6_name;
    }

    public void setS6_name(String s6_name) {
        this.s6_name = s6_name;
    }

    public String getS6_number() {
        return s6_number;
    }

    public void setS6_number(String s6_number) {
        this.s6_number = s6_number;
    }

    public String getS6_seats() {
        return s6_seats;
    }

    public void setS6_seats(String s6_seats) {
        this.s6_seats = s6_seats;
    }

    public String getSs_name() {
        return ss_name;
    }

    public void setSs_name(String ss_name) {
        this.ss_name = ss_name;
    }

    public String getSs_number() {
        return ss_number;
    }

    public void setSs_number(String ss_number) {
        this.ss_number = ss_number;
    }

    public String getSs_seats() {
        return ss_seats;
    }

    public void setSs_seats(String ss_seats) {
        this.ss_seats = ss_seats;
    }
    private String s5_number="";
    private String s5_seats="";
    
    
    private String s6_name="";
    private String s6_number="";
    private String s6_seats="";
    
    
    private String ss_name="";
    private String ss_number="";
    private String ss_seats="";
    

    /**
     *
     */
    public Add_Theater_Model() {
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
