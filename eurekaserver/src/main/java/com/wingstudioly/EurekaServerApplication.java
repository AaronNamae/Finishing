/**
 * ClassName: EurekaServerApplication <br/>
 * Description: <br/>
 * date: 2021/5/5 17:39<br/>
 *
 * @author li yi<br/>
 */
package com.wingstudioly;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

/**
 *ClassName:EurekaServerApplication<br/>
 *Description:<br/>
 *date:2021/5/5 17:39<br/>
 *@author li yi<br/>
 *@version
 */
@EnableEurekaServer
@SpringBootApplication
@EnableDiscoveryClient
public class EurekaServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(EurekaServerApplication.class,args);
    }
}
