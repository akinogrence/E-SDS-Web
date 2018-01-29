package com.wissen.esds.dao.impl;

import com.wissen.esds.HibernateUtility;
import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import com.wissen.esds.dao.DatabaseDao;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

@Repository
public class DatabaseDaoImpl extends JdbcDaoSupport implements DatabaseDao {

    @Autowired
    DataSource dataSource;

    @PostConstruct
    private void initialize() {
        setDataSource(dataSource);
    }

    @Override
    public <T> Query<T> fetch(Session session, CriteriaQuery<T> criteriaQuery) {
        Query<T> query = session.createQuery(criteriaQuery);
        return query;
    }

    @Override
    public <T> void insert(T object) {
        Session session = HibernateUtility.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(object);
        transaction.commit();
    }

    @Override
    public <T> void update(T object) {
        Session session = HibernateUtility.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.update(object);
        transaction.commit();
    }

    @Override
    public <T> void delete(T object) {
        Session session = HibernateUtility.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(object);
        transaction.commit();
    }
}
