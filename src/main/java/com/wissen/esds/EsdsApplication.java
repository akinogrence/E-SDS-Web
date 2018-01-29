package com.wissen.esds;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = {"com.wissen.esds", "com.wissen.esds.controller","com.wissen.esds.rest","com.wissen.esds.service","com.wissen.esds.service.impl","com.wissen.esds.dao","com.wissen.esds.dao.impl","com.wissen.esds.mobile"
})
public class EsdsApplication {

    public static void main(String[] args) {
        SpringApplication.run(EsdsApplication.class, args);
    }
}
