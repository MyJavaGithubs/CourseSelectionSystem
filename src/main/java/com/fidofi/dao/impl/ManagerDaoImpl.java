package com.fidofi.dao.impl;

import com.fidofi.constant.ManagerConstant;
import com.fidofi.dao.ManagerDao;
import org.springframework.stereotype.Repository;

/**
 * Created by fido on 2017/12/25.
 */
@Repository
public class ManagerDaoImpl implements ManagerDao {

    /**
     * 管理员登录
     *
     * @param rootName
     * @param rootPassword
     * @return
     */
    public boolean login(String rootName, String rootPassword) {
        if (ManagerConstant.getRootName().equals(rootName) && ManagerConstant.getRootPassword().equals(rootPassword)) {
            return true;
        } else
            return false;
    }
}
