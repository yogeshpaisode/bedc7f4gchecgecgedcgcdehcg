/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nawandarfilmes.payment.Controller;

import com.nawandarfilmes.Hibernate.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.nawandarfilmes.payment.Model.Party_Model;
import java.text.SimpleDateFormat;
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
public class Party_Controlelr extends org.apache.struts.action.Action {

    /*
     * forward name="success" path=""
     */
    private static final String SUCCESS = "success";

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

        Party_Model pm = (Party_Model) form;
        WorkOrder workOrder;
        String depositerName=pm.getDepo_name();
        Double amtRecv=Double.parseDouble(pm.getAmt_recv());
        Date amtRecvDate=null;
        String amtRecvTime=pm.getTime();
        Boolean recvMg=false;
        Boolean recOther=true;
        Date entryDateTime=new Date();
        String utrNo=pm.getUtr();
        String cheaqueNo=pm.getCheq_no();
        String bankName=pm.getBank();
        int wo_id=Integer.parseInt(pm.getWo_id());
        String payment=pm.getPayment();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        amtRecvDate=formatter.parse(pm.getDate());
        
        SessionFactory sessionFactory=HibernateUtil.getSessionFactory();
        Session session=sessionFactory.openSession();
        Transaction transaction=session.beginTransaction();
        
        Criteria criteria=session.createCriteria(WorkOrder.class);
        criteria.add(Restrictions.eq("woId", wo_id));
        
        workOrder=(WorkOrder)criteria.list().get(0);
        
        if(payment.equals("cash")){
        CashPayment cashPayment=new CashPayment(workOrder, depositerName, amtRecv, amtRecvDate, amtRecvTime, recvMg, recOther, entryDateTime);
        session.save(cashPayment);
        } else
        if(payment.equals("rtgs")){
            NeftRtgsPayment nrp=new NeftRtgsPayment(workOrder, utrNo, depositerName, false, true, amtRecv, amtRecvDate, amtRecvTime, recvMg, recOther, entryDateTime);
            session.save(nrp);
        }else
        if(payment.equals("neft")){
            NeftRtgsPayment nrp=new NeftRtgsPayment(workOrder, utrNo, depositerName, true,false, amtRecv, amtRecvDate, amtRecvTime, recvMg, recOther, entryDateTime);
            session.save(nrp);
        }else
        if(payment.equals("cheaque")){
            CheaquePayment cp=new CheaquePayment(workOrder, cheaqueNo, bankName, depositerName, amtRecv, amtRecvDate, amtRecvTime, recvMg, recOther, entryDateTime);
            session.save(cp);
        }
        
        transaction.commit();
        
        session.close();
        

        return mapping.findForward(SUCCESS);
    }
}
