package yyf.web.test.Pojo;

import java.io.Serializable;

public class HistoryDate implements Serializable {
    private String drive;
    private String time;
    private String date;

    public String getDrive() {
        return drive;
    }

    public void setDrive(String drive) {
        this.drive = drive;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }


}
