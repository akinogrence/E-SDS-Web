package com.wissen.esds.mobile;

import com.wissen.esds.HibernateUtility;
import com.wissen.esds.model.Category;
import com.wissen.esds.model.Product;
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
public class ProductsRest {

    @Autowired
    DatabaseService databaseService;

    @RequestMapping(value = "/getProductsForMobile", method = RequestMethod.POST)
    public String getProducts() {
        Session session = HibernateUtility.getSessionFactory().openSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = criteriaBuilder.createQuery(Product.class);
        Root root = criteriaQuery.from(Product.class);
        criteriaQuery.select(root);
        return databaseService.fetchAsJson(session, criteriaQuery, new Product());
    }

    @RequestMapping(value = "/getProductsByCategoryForMobile", method = RequestMethod.POST)
    public String getProducts(Category category) {
        Session session = HibernateUtility.getSessionFactory().openSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = criteriaBuilder.createQuery(Product.class);
        Root root = criteriaQuery.from(Product.class);
        criteriaQuery.select(root).where(criteriaBuilder.equal(root.get("category").get("id"), category.getId()));
        return databaseService.fetchAsJson(session, criteriaQuery, new Product());
    }
}