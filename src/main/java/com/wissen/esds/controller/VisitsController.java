package com.wissen.esds.controller;

import com.wissen.esds.HibernateUtility;
import com.wissen.esds.model.Customer;
import com.wissen.esds.model.Personnel;
import com.wissen.esds.model.Visit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.wissen.esds.service.DatabaseService;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;

@Controller
@RequestMapping(value = "/", method = RequestMethod.GET)
public class VisitsController {

    @Autowired
    DatabaseService databaseService;

    @RequestMapping(value = "/visits", method = RequestMethod.GET)
    public String visits(Model model) {
        Session session = HibernateUtility.getSessionFactory().openSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = criteriaBuilder.createQuery(Visit.class);
        Root root = criteriaQuery.from(Visit.class);
        criteriaQuery.select(root);
        model.addAttribute("visitList", databaseService.fetchAsObject(session, criteriaQuery));       
        criteriaQuery = criteriaBuilder.createQuery(Personnel.class);
        root = criteriaQuery.from(Personnel.class);
        criteriaQuery.select(root);
        model.addAttribute("personnelListForVisit", databaseService.fetchAsObject(session, criteriaQuery));
        criteriaQuery = criteriaBuilder.createQuery(Customer.class);
        criteriaQuery.from(Customer.class);
        criteriaQuery.select(root);
        model.addAttribute("customerListForVisit", databaseService.fetchAsObject(session, criteriaQuery));
        return "adminPanel";
    }

    @RequestMapping(value = "/addVisit", method = RequestMethod.POST)
    public String addVisit(Model model, Visit visit) {
        databaseService.insert(visit);
        return "redirect:/visits";
    }

    @RequestMapping(value = "/updateVisit", method = RequestMethod.POST)
    public String updateVisit(Model model, Visit visit) {
        databaseService.update(visit);
        return "redirect:/visits";
    }

    @RequestMapping(value = "/deleteVisit", method = RequestMethod.POST)
    public String deleteVisit(Model model, Visit visit) {
        databaseService.delete(visit);
        return "redirect:/visits";
    }
}
