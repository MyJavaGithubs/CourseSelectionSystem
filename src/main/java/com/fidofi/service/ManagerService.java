package com.fidofi.service;

import com.fidofi.VO.ResultVO;

/**
 * Created by fido on 2017/12/25.
 * 管理员
 */
public interface ManagerService {

    public ResultVO<Boolean> login(String rootName, String rootPassword);
}
