package com.wingstudioly.guard;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
public class GuardApplication extends SpringApplication {
    /*@Bean
    @LoadBalanced
    RestTemplate restTemplate(){
        return new RestTemplate();
    }*/
    public static void main(String[] args) {
        SpringApplication.run(GuardApplication.class, args);
    }
}
