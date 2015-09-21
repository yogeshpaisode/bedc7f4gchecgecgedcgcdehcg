/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nawandarfilmes.party.Model;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author yogesh
 */
public class Add_Party_Model extends org.apache.struts.action.ActionForm {
    
     private String p_name="null";
     private String p_std_code="null";
     private String p_std_number="null";
     private String p_email="null";
     private String p_address="null";
     private String p_state="null";
     private String p_city="null";
     private String p_fax="null";
     private String p_country="null";
     private String p_circuit="null";
     private String p_circuit_region="null";
     
     private String m1_name="null";
     private String m1_email="null";
     private String m1_contact="null";
     
     private String m2_name="null";
     private String m2_email="null";
     private String m2_contact="null";
     
     private String m3_name="null";
     private String m3_email="null";
     private String m3_contact="null";
     
     private String m4_name="null";
     private String m4_email="null";
     private String m4_contact="null";
     
     private String m5_name="null";
     private String m5_email="null";
     private String m5_contact="null";

    public String getM1_contact() {
        return m1_contact;
    }

    public void setM1_contact(String m1_contact) {
        this.m1_contact = m1_contact;
    }

    public String getM1_email() {
        return m1_email;
    }

    public void setM1_email(String m1_email) {
        this.m1_email = m1_email;
    }

    public String getM1_name() {
        return m1_name;
    }

    public void setM1_name(String m1_name) {
        this.m1_name = m1_name;
    }

    public String getM2_contact() {
        return m2_contact;
    }

    public void setM2_contact(String m2_contact) {
        this.m2_contact = m2_contact;
    }

    public String getM2_email() {
        return m2_email;
    }

    public void setM2_email(String m2_email) {
        this.m2_email = m2_email;
    }

    public String getM2_name() {
        return m2_name;
    }

    public void setM2_name(String m2_name) {
        this.m2_name = m2_name;
    }

    public String getM3_contact() {
        return m3_contact;
    }

    public void setM3_contact(String m3_contact) {
        this.m3_contact = m3_contact;
    }

    public String getM3_email() {
        return m3_email;
    }

    public void setM3_email(String m3_email) {
        this.m3_email = m3_email;
    }

    public String getM3_name() {
        return m3_name;
    }

    public void setM3_name(String m3_name) {
        this.m3_name = m3_name;
    }

    public String getM4_contact() {
        return m4_contact;
    }

    public void setM4_contact(String m4_contact) {
        this.m4_contact = m4_contact;
    }

    public String getM4_email() {
        return m4_email;
    }

    public void setM4_email(String m4_email) {
        this.m4_email = m4_email;
    }

    public String getM4_name() {
        return m4_name;
    }

    public void setM4_name(String m4_name) {
        this.m4_name = m4_name;
    }

    public String getM5_contact() {
        return m5_contact;
    }

    public void setM5_contact(String m5_contact) {
        this.m5_contact = m5_contact;
    }

    public String getM5_email() {
        return m5_email;
    }

    public void setM5_email(String m5_email) {
        this.m5_email = m5_email;
    }

    public String getM5_name() {
        return m5_name;
    }

    public void setM5_name(String m5_name) {
        this.m5_name = m5_name;
    }

    public String getP_address() {
        return p_address;
    }

    public void setP_address(String p_address) {
        this.p_address = p_address;
    }

    public String getP_circuit() {
        return p_circuit;
    }

    public void setP_circuit(String p_circuit) {
        this.p_circuit = p_circuit;
    }

    public String getP_circuit_region() {
        return p_circuit_region;
    }

    public void setP_circuit_region(String p_circuit_region) {
        this.p_circuit_region = p_circuit_region;
    }

    public String getP_city() {
        return p_city;
    }

    public void setP_city(String p_city) {
        this.p_city = p_city;
    }

    public String getP_country() {
        return p_country;
    }

    public void setP_country(String p_country) {
        this.p_country = p_country;
    }

    public String getP_email() {
        return p_email;
    }

    public void setP_email(String p_email) {
        this.p_email = p_email;
    }

    public String getP_fax() {
        return p_fax;
    }

    public void setP_fax(String p_fax) {
        this.p_fax = p_fax;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getP_state() {
        return p_state;
    }

    public void setP_state(String p_state) {
        this.p_state = p_state;
    }

    public String getP_std_code() {
        return p_std_code;
    }

    public void setP_std_code(String p_std_code) {
        this.p_std_code = p_std_code;
    }

    public String getP_std_number() {
        return p_std_number;
    }

    public void setP_std_number(String p_std_number) {
        this.p_std_number = p_std_number;
    }
   
    /**
     *
     */
    public Add_Party_Model() {
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
       
        return errors;
    }
}
