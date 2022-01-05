/**
 * ClassName: PySidecarApplication <br/>
 * Description: <br/>
 * date: 2021/5/5 17:44<br/>
 *
 * @author li yi<br/>
 */
package com.wingstudioly;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.cloud.netflix.sidecar.EnableSidecar;

@EnableSidecar
@SpringBootApplication
public class PySidecarApplication {

    public static void main(String[] args) {
        SpringApplication.run(PySidecarApplication.class, args);
    }
}

