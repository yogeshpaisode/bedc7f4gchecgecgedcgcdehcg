/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nawandarfilmes.workorder.controller;

import com.nawandarfilmes.Hibernate.*;
import com.nawandarfilmes.workorder.Model.Add_Workorder_Model;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.RandomStringUtils;
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
public class Add_Workorder_Controller extends org.apache.struts.action.Action {

    /*
     * forward name="success" path=""
     */
    private static final String SUCCESS = "view_Workorder";

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

        Add_Workorder_Model awm = (Add_Workorder_Model) form;
        int wo_id = 0;
        String payment_flag="Cash";
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date woStartDate = formatter.parse(awm.getStart_date());
        Date woEndDate = formatter.parse(awm.getEnd_date());

        Date w1_startDate = null;
        Date w1_endDate = null;

        Date w2_startDate = null;
        Date w2_endDate = null;

        Date w3_startDate = null;
        Date w3_endDate = null;

        Date w4_startDate = null;
        Date w4_endDate = null;

        Date w5_startDate = null;
        Date w5_endDate = null;

        Date w6_startDate = null;
        Date w6_endDate = null;
        String spliter[] = null;

        formatter = new SimpleDateFormat("yyyy-MMM-dd");
        if (awm.getD_1().length() > 1) {
            String arg[] = awm.getD_1().split("To");
            spliter = arg[0].split(" ");
            w1_startDate = formatter.parse(spliter[3] + "-" + spliter[1] + "-" + spliter[2]);
            arg[1].trim();
            spliter = arg[1].substring(1).split(" ");
            w1_endDate = formatter.parse(spliter[3] + "-" + spliter[1] + "-" + spliter[2]);
        }

        if (awm.getD_2().length() > 1) {
            String arg[] = awm.getD_2().split("To");
            spliter = arg[0].split(" ");
            w2_startDate = formatter.parse(spliter[3] + "-" + spliter[1] + "-" + spliter[2]);
            spliter = arg[1].substring(1).split(" ");
            w2_endDate = formatter.parse(spliter[3] + "-" + spliter[1] + "-" + spliter[2]);
        }

        if (awm.getD_3().length() > 1) {
            String arg[] = awm.getD_3().split("To");
            spliter = arg[0].split(" ");
            w3_startDate = formatter.parse(spliter[3] + "-" + spliter[1] + "-" + spliter[2]);
            spliter = arg[1].substring(1).split(" ");
            w3_endDate = formatter.parse(spliter[3] + "-" + spliter[1] + "-" + spliter[2]);
        }
        if (awm.getD_4().length() > 1) {
            String arg[] = awm.getD_4().split("To");
            spliter = arg[0].split(" ");
            w4_startDate = formatter.parse(spliter[3] + "-" + spliter[1] + "-" + spliter[2]);
            spliter = arg[1].substring(1).split(" ");
            w4_endDate = formatter.parse(spliter[3] + "-" + spliter[1] + "-" + spliter[2]);
        }
        if (awm.getD_5().length() > 1) {
            String arg[] = awm.getD_5().split("To");
            spliter = arg[0].split(" ");
            w5_startDate = formatter.parse(spliter[3] + "-" + spliter[1] + "-" + spliter[2]);
            spliter = arg[1].substring(1).split(" ");
            w5_endDate = formatter.parse(spliter[3] + "-" + spliter[1] + "-" + spliter[2]);
        }
        if (awm.getD_6().length() > 1) {
            String arg[] = awm.getD_6().split("To");
            spliter = arg[0].split(" ");
            w6_startDate = formatter.parse(spliter[3] + "-" + spliter[1] + "-" + spliter[2]);
            spliter = arg[1].substring(1).split(" ");
            w6_endDate = formatter.parse(spliter[3] + "-" + spliter[1] + "-" + spliter[2]);
        }
        //------------From Model--------------------
        int p_id = Integer.parseInt(awm.getP_id());
        System.out.println("\n\n\n PID " + p_id + "\n\n\n");
        int t_id = Integer.parseInt(awm.getT_id());
        System.out.println("\n\n\n TID " + t_id + "\n\n\n");
        int s_id = Integer.parseInt(awm.getS_id());
        System.out.println("\n\n\n SID " + s_id + "\n\n\n");
        int mov_id = Integer.parseInt(awm.getMov_id());
        System.out.println("\n\n\n MovID " + mov_id + "\n\n\n");
        System.out.println("\n\n\n Shows Per Day :" + awm.getShows_per_day() + "\n\n\n");
        int woShowsPerDay = Integer.parseInt(awm.getShows_per_day());

        String randomString = "nawa#@53662ndarfilmes@43857462distr232ibutionpartyDetail89625438476209388@#$$#@";

        String woUnlockKey = RandomStringUtils.random(9, 0, 9, true, true, randomString.toCharArray()).toUpperCase();


        double t1_rent = Double.parseDouble(awm.getT1_rent());
        double t2_rent = Double.parseDouble(awm.getT2_rent());
        double t3_rent = Double.parseDouble(awm.getT3_rent());
        double t4_rent = Double.parseDouble(awm.getT4_rent());
        double t5_rent = Double.parseDouble(awm.getT5_rent());
        double t6_rent = Double.parseDouble(awm.getT6_rent());

        double distr1_share = Double.parseDouble(awm.getDistr1_share());
        double distr2_share = Double.parseDouble(awm.getDistr2_share());
        double distr3_share = Double.parseDouble(awm.getDistr3_share());
        double distr4_share = Double.parseDouble(awm.getDistr4_share());
        double distr5_share = Double.parseDouble(awm.getDistr5_share());
        double distr6_share = Double.parseDouble(awm.getDistr6_share());

        double owner1_share = Double.parseDouble(awm.getOwner1_share());
        double owner2_share = Double.parseDouble(awm.getOwner2_share());
        double owner3_share = Double.parseDouble(awm.getOwner3_share());
        double owner4_share = Double.parseDouble(awm.getOwner4_share());
        double owner5_share = Double.parseDouble(awm.getOwner5_share());
        double owner6_share = Double.parseDouble(awm.getOwner6_share());

        String wo_type = awm.getWo_type();
        double woMgAmount = Double.parseDouble(awm.getMg_amount());
        String payment_Method = awm.getPayment_Method();
        String utrNo = awm.getUtr_no();
        String cheaqueNo = awm.getCheaque_no();
        String bankName = awm.getBank_name();
        String depositerName = awm.getDepositor_name();
        double amtRecv = Double.parseDouble(awm.getAmount_recv());
        formatter = new SimpleDateFormat("yyyy-MM-dd");

        Date amtRecvDate = null;

        if (awm.getAmount_recv_date().length() > 2) {
            amtRecvDate = formatter.parse(awm.getAmount_recv_date());
        }


        Date woDateTimeOfAddtion = new Date();

        String amtRecvTime = awm.getAmount_recv_time();

        //-------------------------------------------------------------



        MovieDetail movieDetail;
        TheaterDetail theaterDetail;
        ScreenDetail screenDetail;
        PartyDetail partyDetail;
        Boolean woMg = false;
        Boolean woRent = false;
        Boolean woSharing = false;
        Boolean woAggrement = true;
        Boolean woSentEmail = false;
        if (awm.getWoSentEmail().equals("true")) {
            woSentEmail = true;
        }

        if (wo_type.equals("mg")) {
            woMg = true;
        } else if (wo_type.equals("rent")) {
            woRent = true;
        } else {
            woSharing = true;
        }



        //-----------Business logic----------------


        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        Criteria criteria = session.createCriteria(PartyDetail.class);
        criteria.add(Restrictions.eq("PId", p_id));
        partyDetail = (PartyDetail) criteria.list().get(0);

        criteria = session.createCriteria(TheaterDetail.class);
        criteria.add(Restrictions.eq("TId", t_id));
        theaterDetail = (TheaterDetail) criteria.list().get(0);

        criteria = session.createCriteria(ScreenDetail.class);
        criteria.add(Restrictions.eq("SId", s_id));
        screenDetail = (ScreenDetail) criteria.list().get(0);

        criteria = session.createCriteria(MovieDetail.class);
        criteria.add(Restrictions.eq("movId", mov_id));
        movieDetail = (MovieDetail) criteria.list().get(0);


        WorkOrder wo = null;

        criteria = session.createCriteria(WorkOrder.class);
        criteria.add(Restrictions.eq("partyDetail", partyDetail));
        criteria.add(Restrictions.eq("theaterDetail", theaterDetail));
        criteria.add(Restrictions.eq("movieDetail", movieDetail));
        criteria.add(Restrictions.eq("screenDetail", screenDetail));
        criteria.add(Restrictions.eq("woAggrement", true));

        if (criteria.list().size() == 1) {
            wo = (WorkOrder) criteria.list().get(0);
        } else {
            wo = new WorkOrder(movieDetail, theaterDetail, screenDetail, partyDetail, woShowsPerDay, woUnlockKey, woStartDate, woEndDate, woMg, woMgAmount, woRent, woSharing, woAggrement, woSentEmail, woDateTimeOfAddtion, null, null, null, null, null);
            session.save(wo);
            wo_id = wo.getWoId();
            //---Agreement's

            if (!(t1_rent == 0.0)) {
                int weekNo = 1;
                WoAgrrement wa = new WoAgrrement(wo, weekNo, t1_rent, distr1_share, owner1_share, w1_startDate, w1_endDate);
                session.save(wa);
            }

            if (!(t2_rent == 0.0)) {
                int weekNo = 2;
                WoAgrrement wa = new WoAgrrement(wo, weekNo, t2_rent, distr2_share, owner2_share, w2_startDate, w2_endDate);
                session.save(wa);
            }

            if (!(t3_rent == 0.0)) {
                int weekNo = 3;
                WoAgrrement wa = new WoAgrrement(wo, weekNo, t3_rent, distr3_share, owner3_share, w3_startDate, w3_endDate);
                session.save(wa);
            }


            if (!(t4_rent == 0.0)) {
                int weekNo = 4;
                WoAgrrement wa = new WoAgrrement(wo, weekNo, t4_rent, distr4_share, owner4_share, w4_startDate, w4_endDate);
                session.save(wa);
            }

            if (!(t5_rent == 0.0)) {
                int weekNo = 5;
                WoAgrrement wa = new WoAgrrement(wo, weekNo, t5_rent, distr5_share, owner5_share, w5_startDate, w5_endDate);
                session.save(wa);
            }

            if (!(t6_rent == 0.0)) {
                int weekNo = 6;
                WoAgrrement wa = new WoAgrrement(wo, weekNo, t6_rent, distr6_share, owner6_share, w6_startDate, w6_endDate);
                session.save(wa);
            }

            //---Agreement's

            //---Payment

            if (payment_Method.equals("cash")) {
                CashPayment cp = new CashPayment(wo, depositerName, amtRecv, amtRecvDate, amtRecvTime, true, false, new Date());
                payment_flag="cash";
                session.save(cp);
            }
            if (payment_Method.equals("neft")) {
                NeftRtgsPayment neft = new NeftRtgsPayment(wo, utrNo, depositerName, true, false, amtRecv, amtRecvDate, amtRecvTime, true, false, new Date());
                payment_flag="neft";
                session.save(neft);
            }
            if (payment_Method.equals("rtgs")) {
                NeftRtgsPayment rtgs = new NeftRtgsPayment(wo, utrNo, depositerName, false, true, amtRecv, amtRecvDate, amtRecvTime, true, false, new Date());
                payment_flag="rtgs";
                session.save(rtgs);
            }
            if (payment_Method.equals("cheque")) {
                CheaquePayment cp = new CheaquePayment(wo, cheaqueNo, bankName, depositerName, amtRecv, amtRecvDate, amtRecvTime, true, false, new Date());
                payment_flag="cheque";
                session.save(cp);
            }

            //---Payment

            transaction.commit();

        }

        session.close();

        //-----------Business logic----------------
        request.setAttribute("wo_id", wo_id);
        request.setAttribute("payment_flag", payment_flag);
        


        return mapping.findForward(SUCCESS);
    }
}
