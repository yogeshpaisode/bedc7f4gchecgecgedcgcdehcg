/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nawandarfilmes.Login.Model;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.hibernate.SessionFactory;
import com.nawandarfilmes.Hibernate.*;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author yogesh
 */
public class Theater_Model extends org.apache.struts.action.ActionForm {

    private String key = "";
    private WorkOrder workOrder = null;
    private int count=0;

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public WorkOrder getWorkOrder() {
        return workOrder;
    }

    public void setWorkOrder(WorkOrder workOrder) {
        this.workOrder = workOrder;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    /**
     *
     */
    public Theater_Model() {
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
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();

        Criteria criteria = session.createCriteria(WorkOrder.class);
        criteria.add(Restrictions.eq("woUnlockKey", key));

        List wo_List = criteria.list();

        if (wo_List.size() == 1) {
            setWorkOrder((WorkOrder) wo_List.get(0));
            criteria = session.createCriteria(ProfitTicketLog.class);
            criteria.add(Restrictions.eq("workOrder",workOrder));            
            setCount(criteria.list().size());
        } else {
            errors.add("login", new ActionMessage("errors.theater"));
        }
        session.close();

        return errors;
    }
}
