package com.wissen.esds.mobile;

import com.wissen.esds.HibernateUtility;
import com.wissen.esds.model.Personnel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.wissen.esds.service.DatabaseService;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;

@RestController
public class LoginRest {

    @Autowired
    DatabaseService databaseService;

    @RequestMapping(value = "/doLoginWithMobile", method = RequestMethod.POST)
    public boolean doLoginWithMobile(Personnel personnel) {
        Session session = HibernateUtility.getSessionFactory().openSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = criteriaBuilder.createQuery(Personnel.class);
        Root root = criteriaQuery.from(Personnel.class);
        criteriaQuery.select(root).where(criteriaBuilder.and(criteriaBuilder.equal(root.get("userName"), personnel.getUserName()), criteriaBuilder.equal(root.get("password"), personnel.getPassword())));
        return databaseService.fetchAsObject(session, criteriaQuery).size() > 0;
    }
}
