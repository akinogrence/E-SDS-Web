package com.wissen.esds.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wissen.esds.dao.DatabaseDao;
import com.wissen.esds.service.DatabaseService;
import java.lang.reflect.Method;
import java.util.List;
import javax.persistence.criteria.CriteriaQuery;
import org.hibernate.Session;
import org.json.JSONArray;
import org.json.JSONObject;

@Service
public class DatabaseServiceImpl implements DatabaseService {

    @Autowired
    DatabaseDao databaseDao;

    @Override
    public <T> List<T> fetchAsObject(Session session, CriteriaQuery<T> criteriaQuery) {
        return databaseDao.fetch(session, criteriaQuery).getResultList();
    }

    @Override
    public <T> String fetchAsJson(Session session, CriteriaQuery<T> criteriaQuery, T object) {
        List<T> list = (List<T>) databaseDao.fetch(session, criteriaQuery).getResultList();
        Method[] methods = object.getClass().getDeclaredMethods();
        JSONArray jSONArray = new JSONArray();
        for (T instance : list) {
            jSONArray.put(fetchAsJsonHelper(instance));
        }
        return jSONArray.toString();
    }

    private <T> JSONObject fetchAsJsonHelper(T object) {
        JSONObject jSONObject = new JSONObject();
        Method[] methods = object.getClass().getDeclaredMethods();
        try {
            for (Method method : methods) {
                if (method.getName().startsWith("get") && !method.invoke(object).getClass().getName().contains("org")) {
                    if (method.invoke(object).getClass().getName().contains("com")) {
                        jSONObject.put(method.getName().substring(3, 4).toLowerCase() + method.getName().substring(4), fetchAsJsonHelper(method.invoke(object)));
                    } else {
                        jSONObject.put(method.getName().substring(3, 4).toLowerCase() + method.getName().substring(4), method.invoke(object).toString());
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jSONObject;
    }

    @Override
    public <T> void insert(T object) {
        databaseDao.insert(object);
    }

    @Override
    public <T> void update(T object) {
        databaseDao.update(object);
    }

    @Override
    public <T> void delete(T object) {
        databaseDao.delete(object);
    }

    @Override
    public <T> String fetchGoogleChartData(Session session, CriteriaQuery<T> criteriaQuery) {
        List<T> list = databaseDao.fetch(session, criteriaQuery).getResultList();

        JSONArray jSONArray = new JSONArray();
        JSONArray jSONArrayTitle = new JSONArray();
        jSONArrayTitle.put("Task");
        jSONArrayTitle.put("Hours per Day");
        jSONArray.put(jSONArrayTitle);

        return jSONArray.toString();
    }

}
