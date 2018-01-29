package com.wissen.esds.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.wissen.esds.service.DatabaseService;

@Controller
@RequestMapping(value = "/", method = RequestMethod.GET)
public class HomeController {

    @Autowired
    DatabaseService databaseService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getMainPage() {
        return "adminPanel";
    }
}
