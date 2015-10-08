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
import com.nawandarfilmes.Login.Model.Admin_Model;
import javax.servlet.http.HttpSession;
/**
 *
 * @author yogesh
 */
public class Admin_Controller extends org.apache.struts.action.Action {

    /*
     * forward name="success" path=""
     */
    private static String SUCCESS = "home-priless.jsp";

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
        Admin_Model model=(Admin_Model) form;
        HttpSession session=request.getSession();
        String key=model.getKey();
        if(key.equals("admin")){
            SUCCESS="/admin/home.jsp";
            session.setAttribute("admin", "admin");
        }
        else{
            session.setAttribute("operator", "operator");
        }
        return mapping.findForward(SUCCESS);
    }
}
