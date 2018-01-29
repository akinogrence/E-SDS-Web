package com.wissen.esds.controller;

import com.wissen.esds.HibernateUtility;
import com.wissen.esds.model.Admin;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.wissen.esds.service.DatabaseService;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;

@Controller
@RequestMapping(value = "/", method = RequestMethod.GET)
public class AccountsController {

    @Autowired
    DatabaseService databaseService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String mainPage() {
        return "login";
    }

    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public String doLogin(HttpSession httpSession, Admin admin) {
        Session session = HibernateUtility.getSessionFactory().openSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = criteriaBuilder.createQuery(Admin.class);
        Root root = criteriaQuery.from(Admin.class);
        criteriaQuery.select(root).where(criteriaBuilder.and(criteriaBuilder.equal(root.get("userName"), admin.getUserName()), criteriaBuilder.equal(root.get("password"), admin.getPassword())));
        if (databaseService.fetchAsObject(session, criteriaQuery).size() > 0) {
            httpSession.setAttribute("admin", admin.getUserName());
            return "redirect:/";
        } else {
            return "redirect:/login";
        }
    }

    @RequestMapping(value = "/doLogout", method = RequestMethod.GET)
    public String doLogout(HttpSession session) {
        session.removeAttribute("admin");
        return "redirect:/login";
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public String changePassword(HttpSession session, Admin admin) {
        admin.setUserName(session.getAttribute("admin").toString());
        databaseService.update(admin);
        return "redirect:/login";
    }
}
