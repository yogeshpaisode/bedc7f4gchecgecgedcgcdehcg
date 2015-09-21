/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nawandarfilmes.Login.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.nawandarfilmes.Login.Model.Theater_Model;
import com.nawandarfilmes.Hibernate.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author yogesh
 */
public class Theater_Controller extends org.apache.struts.action.Action {

    /*
     * forward name="success" path=""
     */
    private static final String SUCCESS = "Login_Theater";

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

        Theater_Model t_Model = (Theater_Model) form;
        WorkOrder wo = t_Model.getWorkOrder();
        int wo_id = wo.getWoId();

        Date staDate = wo.getWoStartDate();
        Date endDate = wo.getWoEndDate();

        int count = t_Model.getCount();

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Calendar c = Calendar.getInstance();
        c.setTime(staDate); // Now use today date.
        c.add(Calendar.DATE, count);
        String log_date = sdf.format(c.getTime());

        request.setAttribute("date", log_date);
        request.setAttribute("wo_id", wo.getWoId() + "");

        if (endDate.before(c.getTime())) {
            request.setAttribute("flag", "false");
            SessionFactory sessionFactory=HibernateUtil.getSessionFactory();
            Session session=sessionFactory.openSession();
            Transaction transaction=session.beginTransaction();
            
            Criteria criteria=session.createCriteria(WorkOrder.class);
            criteria.add(Restrictions.eq("woId",wo_id));
            
            wo=(WorkOrder)criteria.list().get(0);
            wo.setWoAggrement(false);
            
            session.save(wo);
            transaction.commit();
            session.close();
            
            request.setAttribute("msg", "Your Aggrement Is Ended.");
        }else if (new Date().before(staDate)) {
            request.setAttribute("flag", "false");
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            request.setAttribute("msg", "Your Entry Will Start After Date: " + dateFormat.format(staDate));
        } else
        {
            request.setAttribute("flag", "true");
        }
        return mapping.findForward(SUCCESS);
    }
}
