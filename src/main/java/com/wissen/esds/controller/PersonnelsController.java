package com.wissen.esds.controller;

import com.wissen.esds.HibernateUtility;
import com.wissen.esds.model.Personnel;
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
public class PersonnelsController {

    @Autowired
    DatabaseService databaseService;

    @RequestMapping(value = "/personnels", method = RequestMethod.GET)
    public String personnels(Model model) {
        Session session = HibernateUtility.getSessionFactory().openSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = criteriaBuilder.createQuery(Personnel.class);
        Root root = criteriaQuery.from(Personnel.class);
        criteriaQuery.select(root);
        model.addAttribute("personnelList", databaseService.fetchAsObject(session, criteriaQuery));
        return "adminPanel";
    }

    @RequestMapping(value = "/addPersonnel", method = RequestMethod.POST)
    public String addPersonnel(Personnel personnel) {
        databaseService.insert(personnel);
        return "redirect:/personnels";
    }

    @RequestMapping(value = "/updatePersonnel", method = RequestMethod.POST)
    public String updatePersonnel(Personnel personnel) {
        databaseService.update(personnel);
        return "redirect:/personnels";
    }

    @RequestMapping(value = "/deletePersonnel", method = RequestMethod.POST)
    public String deletePersonnel(Personnel personnel) {
        databaseService.delete(personnel);
        return "redirect:/personnels";
    }
}
