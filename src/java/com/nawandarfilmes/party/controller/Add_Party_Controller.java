/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nawandarfilmes.party.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.nawandarfilmes.party.Model.Add_Party_Model;
import java.util.Date;
import org.hibernate.SessionFactory;
import com.nawandarfilmes.Hibernate.*;
import org.apache.commons.lang3.RandomStringUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author yogesh
 */
public class Add_Party_Controller extends org.apache.struts.action.Action {

    /*
     * forward name="success" path=""
     */
    private static final String SUCCESS = "show_Party";

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

        Add_Party_Model add_Model = (Add_Party_Model) form;

        String PName = add_Model.getP_name();
        String PEmail = add_Model.getP_email();
        int PStdCode = Integer.parseInt(add_Model.getP_std_code());
        String POfficeNumber = add_Model.getP_std_number();
        String PAddress = add_Model.getP_address();
        String PState = add_Model.getP_state();
        String PCity = add_Model.getP_city();
        String PFax = add_Model.getP_fax();
        String PCountry = add_Model.getP_country();
        String PCircuit = add_Model.getP_circuit();
        String PCircuitRegion = add_Model.getP_circuit_region();
        Date PDatetimeAddition = new Date();

        String m1_name = add_Model.getM1_name();
        String m1_email = add_Model.getM1_email();
        String m1_contact = add_Model.getM1_contact();

        String m2_name = add_Model.getM2_name();
        String m2_email = add_Model.getM2_email();
        String m2_contact = add_Model.getM2_contact();

        String m3_name = add_Model.getM3_name();
        String m3_email = add_Model.getM3_email();
        String m3_contact = add_Model.getM3_contact();

        String m4_name = add_Model.getM4_name();
        String m4_email = add_Model.getM4_email();
        String m4_contact = add_Model.getM4_contact();

        String m5_name = add_Model.getM5_name();
        String m5_email = add_Model.getM5_email();
        String m5_contact = add_Model.getM5_contact();
        PartyDetail partyDetail = null;

        String randomString = "nawandarfilmesdistribution" + new Date() + "partyDetail" + PEmail + "89625438476209388@#$$#@" + PName;
        String PPassword = RandomStringUtils.random(9, 0, 9, true, true, randomString.toCharArray()).toUpperCase();

        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();

        Criteria criteria = session.createCriteria(PartyDetail.class);
        criteria.add(Restrictions.eq("PName", PName));
        criteria.add(Restrictions.eq("PEmail", PEmail));
        criteria.add(Restrictions.eq("POfficeNumber", POfficeNumber));
        criteria.add(Restrictions.eq("PAddress", PAddress));
        criteria.add(Restrictions.eq("PFax", PFax));

        if (criteria.list().size() >= 1) {
            partyDetail = (PartyDetail) criteria.list().get(0);
        } else {

            Transaction transaction = session.beginTransaction();
            partyDetail = new PartyDetail(PName, PEmail, PPassword, PStdCode, POfficeNumber, PAddress, PState, PCity, PFax, PCountry, PCircuit, PCircuitRegion, PDatetimeAddition, null, null, null, null);
            session.save(partyDetail);

            if (!(m1_name.length() <= 0)) {
                MembersDetail membersDetail = new MembersDetail(partyDetail, m1_name, m1_email, m1_contact);
                session.save(membersDetail);
            }

            if (!(m2_name.length() <= 0)) {
                MembersDetail membersDetail = new MembersDetail(partyDetail, m2_name, m2_email, m2_contact);
                session.save(membersDetail);
            }

            if (!(m3_name.length() <= 0)) {
                MembersDetail membersDetail = new MembersDetail(partyDetail, m3_name, m3_email, m3_contact);
                session.save(membersDetail);
            }

            if (!(m4_name.length() <= 0)) {
                MembersDetail membersDetail = new MembersDetail(partyDetail, m4_name, m4_email, m4_contact);
                session.save(membersDetail);
            }

            if (!(m5_name.length() <= 0)) {
                MembersDetail membersDetail = new MembersDetail(partyDetail, m5_name, m5_email, m5_contact);
                session.save(membersDetail);
            }

            transaction.commit();
        }
        request.setAttribute("p_id", partyDetail.getPId() + "");
        session.close();

        return mapping.findForward(SUCCESS);
    }
}
