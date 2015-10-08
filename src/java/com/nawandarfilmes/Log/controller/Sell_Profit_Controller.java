/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nawandarfilmes.Log.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.nawandarfilmes.Log.Model.Sell_Profit_Model;
import java.text.SimpleDateFormat;
import java.util.Date;
import com.nawandarfilmes.Hibernate.*;
import com.nawandarfilmes.commonUtility.Common;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author yogesh
 */
public class Sell_Profit_Controller extends org.apache.struts.action.Action {

    /*
     * forward name="success" path=""
     */
    private static final String SUCCESS = "view_all_Profit_Ticket";

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

        Sell_Profit_Model spm = (Sell_Profit_Model) form;
        int ticketSold = Integer.parseInt(spm.getTicket());
        int wo_id = Integer.parseInt(spm.getWo_id());
        double grossProfit = Double.parseDouble(spm.getGross());
        double nettProfit = Double.parseDouble(spm.getNett());
        double edtaxProfit = Double.parseDouble(spm.getEdtax());
        int show_for_day=Integer.parseInt(spm.getShows_count());
        Common common=new Common();

        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date logDate = formatter.parse(spm.getDate());
        Date entryDateTime = new Date();

        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();

        Criteria criteria = session.createCriteria(WorkOrder.class);
        criteria.add(Restrictions.eq("woId", wo_id));
        WorkOrder wo = (WorkOrder) criteria.list().get(0);

        criteria = session.createCriteria(ProfitTicketLog.class);
        criteria.add(Restrictions.eq("workOrder", wo));
        criteria.add(Restrictions.eq("logDate", logDate));

        if (criteria.list().size() == 0) {
            Transaction transaction = session.beginTransaction();
            ProfitTicketLog log = new ProfitTicketLog(wo, ticketSold, grossProfit, nettProfit, edtaxProfit, logDate, entryDateTime);
            session.save(log);
            //--If Agrrement Ended
            if (wo.getWoEndDate().equals(logDate)) {
                wo.setWoAggrement(false);
                session.save(wo);
            }
            transaction.commit();
            if(show_for_day<wo.getWoShowsPerDay()&&wo.getWoRent()){
                int deduction=wo.getWoShowsPerDay()-show_for_day;
                common.deductRent(deduction, wo, logDate);
            }
        }
        session.close();

        request.setAttribute("wo_id", wo_id);


        return mapping.findForward(SUCCESS);
    }
}
