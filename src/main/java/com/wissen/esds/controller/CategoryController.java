package com.wissen.esds.controller;

import com.wissen.esds.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.wissen.esds.service.DatabaseService;

@Controller
@RequestMapping(value = "/", method = RequestMethod.GET)

public class CategoryController {

    @Autowired
    DatabaseService databaseService;

    @RequestMapping(value = "/addCategory", method = RequestMethod.POST)
    public String addCategory(Model model, Category category) {
        databaseService.insert(category);
        return "redirect:/products";
    }

    @RequestMapping(value = "/updateCategory", method = RequestMethod.POST)
    public String updateCategory(Model model, Category category) {
        databaseService.update(category);
        return "redirect:/products";
    }

    @RequestMapping(value = "/deleteCategory", method = RequestMethod.POST)
    public String deleteCategory(Model model, Category category) {
        databaseService.delete(category);
        return "redirect:/products";
    }
}
