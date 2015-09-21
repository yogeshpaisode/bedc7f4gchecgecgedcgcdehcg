/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nawandarfilmes.movie.Model;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author yogesh
 */
public class Add_Movie_Model extends org.apache.struts.action.ActionForm {
    
   private String m_name="";

    public String getM_banner_img_link() {
        return m_banner_img_link;
    }

    public void setM_banner_img_link(String m_banner_img_link) {
        this.m_banner_img_link = m_banner_img_link;
    }

    public String getM_name() {
        return m_name;
    }

    public void setM_name(String m_name) {
        this.m_name = m_name;
    }

    public String getM_producer() {
        return m_producer;
    }

    public void setM_producer(String m_producer) {
        this.m_producer = m_producer;
    }

    public String getM_release_date() {
        return m_release_date;
    }

    public void setM_release_date(String m_release_date) {
        this.m_release_date = m_release_date;
    }

    public String getM_youtube_link() {
        return m_youtube_link;
    }

    public void setM_youtube_link(String m_youtube_link) {
        this.m_youtube_link = m_youtube_link;
    }
   private String m_producer="";
   private String m_release_date="";
   private String m_banner_img_link="";
   private String m_youtube_link="";
   
   /**
     *
     */
    public Add_Movie_Model() {
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
