/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nawandarfilmes.movie.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.nawandarfilmes.movie.Model.Add_Movie_Model;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.hibernate.SessionFactory;
import com.nawandarfilmes.Hibernate.*;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author yogesh
 */
public class Add_Movie_Controller extends org.apache.struts.action.Action {

    /*
     * forward name="success" path=""
     */
    private static final String SUCCESS = "show_Movie";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return 2015-09-16
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        Add_Movie_Model  amm=(Add_Movie_Model) form;
        
        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
        String movName=amm.getM_name();
        String movProduces=amm.getM_producer();
        Date movReleaseDate = formatter.parse(amm.getM_release_date());
        String movBannesImgLink=amm.getM_banner_img_link();
        String movYoutubeLink=amm.getM_youtube_link();
        int mov_id;
        
       
        SessionFactory sessionFactory=HibernateUtil.getSessionFactory();
        Session session=sessionFactory.openSession();
        Transaction transaction=session.beginTransaction();
        
        MovieDetail movieDetail=new MovieDetail(movName, movProduces, movReleaseDate, movBannesImgLink, movYoutubeLink, null);
        session.save(movieDetail);
        mov_id=movieDetail.getMovId();
        transaction.commit();
        session.close();
        
        request.setAttribute("mov_id",mov_id);
        
        
        return mapping.findForward(SUCCESS);
    }
}
