package com.example.springdeploy;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

//@SpringBootTest
class SpringDeployApplicationTests {


    @Test
    void contextLoads() {
        System.getenv().forEach((k, v) -> System.out.println(k + " " + v));
    }

}
