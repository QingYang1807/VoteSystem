package com.lf.entity;

public class User {
    private int userId;
    private String userName;
    private String userPassword;
    private String userRoleName;
    private String userPhoneNumber;
    private String userGender;
    private int userStatus;
    private String userVersion;

    public User(){}
    public User(int userId, String userName, String userPassword, String userRoleName, String userPhoneNumber, String userGender, int userStatus, String userVersion) {
        this.userId = userId;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userRoleName = userRoleName;
        this.userPhoneNumber = userPhoneNumber;
        this.userGender = userGender;
        this.userStatus = userStatus;
        this.userVersion = userVersion;
    }
    public User(String userName, String userPassword, String userRoleName, String userPhoneNumber, String userGender, String userVersion) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.userRoleName = userRoleName;
        this.userPhoneNumber = userPhoneNumber;
        this.userGender = userGender;
        this.userVersion = userVersion;
    }

    public User(String userName, String userPassword, String userRoleName, String userPhoneNumber, String userGender, int i, String userVersion) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.userRoleName = userRoleName;
        this.userPhoneNumber = userPhoneNumber;
        this.userGender = userGender;
        this.userStatus = userStatus;
        this.userVersion = userVersion;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserRoleName() {
        return userRoleName;
    }

    public void setUserRoleName(String userRoleName) {
        this.userRoleName = userRoleName;
    }

    public String getUserPhoneNumber() {
        return userPhoneNumber;
    }

    public void setUserPhoneNumber(String userPhoneNumber) {
        this.userPhoneNumber = userPhoneNumber;
    }

    public String getUserGender() {
        return userGender;
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender;
    }

    public int getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(int userStatus) {
        this.userStatus = userStatus;
    }

    public String getUserVersion() {
        return userVersion;
    }

    public void setUserVersion(String userVersion) {
        this.userVersion = userVersion;
    }
}
