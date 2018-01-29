package com.wissen.esds.dao;
;

import javax.persistence.criteria.CriteriaQuery;
import org.hibernate.Session;
import org.hibernate.query.Query;

public interface DatabaseDao {

    <T> Query<T> fetch(Session session, CriteriaQuery<T> criteriaQuery);

    <T> void insert(T object);

    <T> void update(T object);

    <T> void delete(T object);
}
