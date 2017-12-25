package com.fidofi.entity;

/**
 * Created by fido on 2017/12/25.
 * 管理员
 */
public class Manager {

    private String rootName;
    private String rootPassword;

    public String getRootName() {
        return rootName;
    }

    public void setRootName(String rootName) {
        this.rootName = rootName;
    }

    public String getRootPassword() {
        return rootPassword;
    }

    public void setRootPassword(String rootPassword) {
        this.rootPassword = rootPassword;
    }

    @Override
    public String toString() {
        return "Manager{" +
                "rootName='" + rootName + '\'' +
                ", rootPassword='" + rootPassword + '\'' +
                '}';
    }
}
