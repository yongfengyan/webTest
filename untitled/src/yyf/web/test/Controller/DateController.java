package yyf.web.test.Controller;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import yyf.web.test.Pojo.UserInfo;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/date")
public class DateController {

    @RequestMapping("/history")
    public String history(Model model,@RequestParam("name") String name) {

        UserInfo user1 = new UserInfo(name,"password");
        UserInfo user2 = new UserInfo("YYF_TEST","password");
        List<UserInfo>  userInfos = new ArrayList<>();
        userInfos.add(user1);
        userInfos.add(user2);
        JSONArray jsonArray = JSONArray.fromObject(userInfos);
        System.out.println(jsonArray);
        model.addAttribute("json",jsonArray);
        return "/WEB-INF/testindex.jsp";
    }

    @RequestMapping("/historyjson")
    @ResponseBody
    public String historyJson(@RequestParam("name") String name) {

        UserInfo user1 = new UserInfo(name,"password");
        UserInfo user2 = new UserInfo("YYF_TEST","password");
        List<UserInfo>  userInfos = new ArrayList<>();
        userInfos.add(user1);
        userInfos.add(user2);
        JSONArray jsonArray = JSONArray.fromObject(userInfos);
        System.out.println(jsonArray);
        return String.valueOf(jsonArray);
    }
}
