package com.wissen.esds.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.wissen.esds.service.DatabaseService;

@RestController
public class ChartRest {

    @Autowired
    DatabaseService databaseService;

    @ResponseBody
    @RequestMapping(value = "/chart", method = RequestMethod.POST)
    public String getChart() {
        String query
                = "select personnels.`name`, count(*) from orders "
                + "inner join visits on orders.visit_id=visits.id "
                + "inner join personnels on visits.personnel_id=personnels.id "
                + "group by personnels.`name` "
                + "order by count(*) desc limit 10";

        return "";
    }
}
