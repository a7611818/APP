package com.ybq.service;

import com.ybq.pojo.DevUser;

public interface DevUserService {
    DevUser login(DevUser dev_user);

    boolean register(DevUser devUser);

    boolean checkDevCode(String devCode);
}
