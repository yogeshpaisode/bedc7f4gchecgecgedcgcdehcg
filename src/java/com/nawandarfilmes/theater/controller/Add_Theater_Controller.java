/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nawandarfilmes.theater.controller;

import com.nawandarfilmes.Hibernate.HibernateUtil;
import com.nawandarfilmes.Hibernate.PartyDetail;
import com.nawandarfilmes.Hibernate.ScreenDetail;
import com.nawandarfilmes.Hibernate.TheaterDetail;
import com.nawandarfilmes.theater.Model.Add_Theater_Model;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author yogesh
 */
public class Add_Theater_Controller extends org.apache.struts.action.Action {

    /*
     * forward name="success" path=""
     */
    private static final String SUCCESS = "show_Theater";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        try {

            Add_Theater_Model atm = (Add_Theater_Model) form;


            int p_id = Integer.parseInt(atm.getP_id());
            String TName = atm.getT_name();
            String TAddress = atm.getT_address();
            String TState = atm.getT_state();
            String TCity = atm.getT_city();
            String TCountry = atm.getT_country();
            String TEmail = atm.getT_email();
           
            int TStdCode = Integer.parseInt(atm.getT_std_Code());
            String TPhoneNumber = atm.getT_phone();
            String TType = atm.getT_type();
            Date TDatetimeAddition = new Date();
            int TNoScreens =0;


            String s1_name = atm.getS1_name();
            String s1_number = atm.getS1_number();
            String s1_seats = atm.getS1_seats();

            String s2_name = atm.getS2_name();
            String s2_number = atm.getS2_number();
            String s2_seats = atm.getS2_seats();

            String s3_name = atm.getS3_name();
            String s3_number = atm.getS3_number();
            String s3_seats = atm.getS3_seats();

            String s4_name = atm.getS4_name();
            String s4_number = atm.getS4_number();
            String s4_seats = atm.getS4_seats();

            String s5_name = atm.getS5_name();
            String s5_number = atm.getS5_number();
            String s5_seats = atm.getS5_seats();

            String s6_name = atm.getS6_name();
            String s6_number = atm.getS6_number();
            String s6_seats = atm.getS6_seats();

            String ss_name = atm.getSs_name();
            String ss_number = atm.getSs_number();
            String ss_seats = atm.getSs_seats();



            PartyDetail partyDetail = null;
            List party_Detail = null;
            TheaterDetail theaterDetail = null;
            int t_id = 0;

            SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
            Session session = sessionFactory.openSession();

            Criteria cr = session.createCriteria(PartyDetail.class);
            cr.add(Restrictions.eq("PId", p_id));
            party_Detail = cr.list();

            partyDetail = (PartyDetail) party_Detail.get(0);

            cr = session.createCriteria(TheaterDetail.class);
            cr.add(Restrictions.eq("TName", TName));
            cr.add(Restrictions.eq("TAddress", TAddress));
            cr.add(Restrictions.eq("TEmail", TEmail));
            cr.add(Restrictions.eq("TPhoneNumber", TPhoneNumber));
            cr.add(Restrictions.eq("TNoScreens", TNoScreens));
            cr.add(Restrictions.eq("partyDetail", partyDetail));


            if (cr.list().size() >= 1) {
                theaterDetail = (TheaterDetail) cr.list().get(0);
                t_id = theaterDetail.getTId();
            } else {

                Transaction transaction = session.beginTransaction();

                theaterDetail = new TheaterDetail(partyDetail, TName, TAddress, TState, TCity, TCountry, TEmail, TStdCode, TPhoneNumber, TType, TDatetimeAddition, TNoScreens, null, null);
                session.save(theaterDetail);



                if (TType.equals("Single Screen")) {
                    System.out.println("\n\n\n" + ss_name + "\n\n\n");
                    ScreenDetail screenDetail = new ScreenDetail(theaterDetail, partyDetail, ss_name, Integer.parseInt(ss_number), Integer.parseInt(ss_seats), null);
                    session.save(screenDetail);

                } else {

                    if (!(s1_name.length() <= 0)) {
                        ScreenDetail screenDetail = new ScreenDetail(theaterDetail, partyDetail, s1_name, Integer.parseInt(s1_number), Integer.parseInt(s1_seats), null);
                        session.save(screenDetail);
                    }

                    if (!(s2_name.length() <= 0)) {
                        ScreenDetail screenDetail = new ScreenDetail(theaterDetail, partyDetail, s2_name, Integer.parseInt(s2_number), Integer.parseInt(s2_seats), null);
                        session.save(screenDetail);
                    }

                    if (!(s3_name.length() <= 0)) {
                        ScreenDetail screenDetail = new ScreenDetail(theaterDetail, partyDetail, s3_name, Integer.parseInt(s3_number), Integer.parseInt(s3_seats), null);
                        session.save(screenDetail);
                    }

                    if (!(s4_name.length() <= 0)) {
                        ScreenDetail screenDetail = new ScreenDetail(theaterDetail, partyDetail, s4_name, Integer.parseInt(s4_number), Integer.parseInt(s4_seats), null);
                        session.save(screenDetail);
                    }

                    if (!(s5_name.length() <= 0)) {
                        ScreenDetail screenDetail = new ScreenDetail(theaterDetail, partyDetail, s5_name, Integer.parseInt(s5_number), Integer.parseInt(s5_seats), null);
                        session.save(screenDetail);
                    }

                    if (!(s6_name.length() <= 0)) {
                        ScreenDetail screenDetail = new ScreenDetail(theaterDetail, partyDetail, s6_name, Integer.parseInt(s6_number), Integer.parseInt(s6_seats), null);
                        session.save(screenDetail);
                    }

                }


                t_id = theaterDetail.getTId();
                transaction.commit();

            }
            session.close();
            request.setAttribute("p_id", p_id + "");
            request.setAttribute("t_id", t_id + "");

        } catch (Exception e) {
            System.out.println("\n\n\n" + e + "\n\n\n");
        }


        return mapping.findForward(SUCCESS);
    }
}
