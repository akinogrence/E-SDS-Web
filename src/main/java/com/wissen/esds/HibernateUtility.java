package com.wissen.esds;

import com.wissen.esds.model.Admin;
import com.wissen.esds.model.Category;
import com.wissen.esds.model.Customer;
import com.wissen.esds.model.Order;
import com.wissen.esds.model.OrderDetail;
import com.wissen.esds.model.Personnel;
import com.wissen.esds.model.Product;
import com.wissen.esds.model.Visit;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class HibernateUtility {

    private static SessionFactory sessionFactory;
    
    private HibernateUtility(){
    
    }

    private static SessionFactory buildSessionFactory() {
        Configuration configuration = new Configuration();
        configuration.configure("hibernate.cfg.xml");
        configuration.addAnnotatedClass(Admin.class);
        configuration.addAnnotatedClass(Category.class);
        configuration.addAnnotatedClass(Customer.class);
        configuration.addAnnotatedClass(Order.class);
        configuration.addAnnotatedClass(OrderDetail.class);
        configuration.addAnnotatedClass(Personnel.class);
        configuration.addAnnotatedClass(Product.class);
        configuration.addAnnotatedClass(Visit.class);
        ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
        SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
        return sessionFactory;
    }

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            sessionFactory = buildSessionFactory();
        }
        return sessionFactory;
    }
}
