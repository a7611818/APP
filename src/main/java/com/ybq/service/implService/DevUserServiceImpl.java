package com.ybq.service.implService;

import com.ybq.mapper.DevUserMapper;
import com.ybq.pojo.DevUser;
import com.ybq.service.DevUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DevUserServiceImpl implements DevUserService {

    @Autowired
    private DevUserMapper mapper;

    public DevUser login(DevUser dev_user) {

        List<DevUser> users = mapper.queryByNamePwd(dev_user);
        if (users != null && users.size() ==1){
            return users.get(0);
        }

        return null;
    }
}
