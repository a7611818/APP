package com.ybq;

import com.ybq.service.implService.AppCategoryServiceImpl;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test001 {

    @Test
    public void m1(){
        ApplicationContext c = new ClassPathXmlApplicationContext(
                "applicationContext.xml");
        AppCategoryServiceImpl haha = c.getBean("haha",AppCategoryServiceImpl.class);


    }
}
