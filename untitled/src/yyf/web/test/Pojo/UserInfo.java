package yyf.web.test.Pojo;

import java.io.Serializable;

public class UserInfo implements Serializable {
    public UserInfo (String UserName,String Pwd){
        this.UserName = UserName;
        this.Pwd = Pwd;
    }
    private String UserName;

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getPwd() {
        return Pwd;
    }

    public void setPwd(String pwd) {
        Pwd = pwd;
    }

    private String Pwd;
}
