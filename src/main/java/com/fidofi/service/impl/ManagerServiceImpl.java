package com.fidofi.service.impl;

import com.fidofi.VO.ResultVO;
import com.fidofi.dao.ManagerDao;
import com.fidofi.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by fido on 2017/12/25.
 */
@Service
public class ManagerServiceImpl implements ManagerService {
    @Autowired
    private ManagerDao managerDao;

    public ResultVO<Boolean> login(String rootName, String rootPassword) {
        boolean flag = managerDao.login(rootName, rootPassword);
        ResultVO resultVO;
        if (flag == true) {
            resultVO = ResultVO.createBySuccess("登录成功",true);
        } else
            resultVO = ResultVO.createBySuccess("用户名或者密码错误，请检查", false);
        return resultVO;
    }
}
