package com.wissen.esds.service;

import java.util.List;
import javax.persistence.criteria.CriteriaQuery;
import org.hibernate.Session;

public interface DatabaseService {
    
    <T> List<T> fetchAsObject(Session session, CriteriaQuery<T> criteriaQuery);

    <T> String fetchAsJson(Session session, CriteriaQuery<T> criteriaQuery, T object);

    <T> String fetchGoogleChartData(Session session, CriteriaQuery<T> criteriaQuery);

    <T> void insert(T object);

    <T> void update(T object);

    <T> void delete(T object);
}
