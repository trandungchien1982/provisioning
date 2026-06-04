package com.example.unleashffdemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;

@SpringBootApplication
@ConfigurationPropertiesScan
public class UnleashFfDemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(UnleashFfDemoApplication.class, args);
    }
}
