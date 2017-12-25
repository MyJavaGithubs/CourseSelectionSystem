package com.fidofi.dao;

import com.fidofi.entity.Manager;

/**
 * Created by fido on 2017/12/25.
 */
public interface ManagerDao {
    public boolean login(String rootName, String rootPassword);

}
