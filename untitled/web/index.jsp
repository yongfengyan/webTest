<%--
  Created by IntelliJ IDEA.
  User: YYF
  Date: 2019/5/16
  Time: 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" pageEncoding="UTF-8" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="net.sf.json.JSONArray" %>
<html>
  <head>
    <title>YYF</title>
  </head>
  <body>
  <script language="javascript" src="JS/jquery-1.7.2.min.js"></script>
  <script language="javascript" src="JS/jquery-1.11.0.min.js"></script>
  <script language="javascript" src="JS/highcharts.js"></script>
  <script language="javascript" src="JS/drawcharts.js"></script>

  YYF
  温度传感器监控系统<br><br>
  <script>
      $(document).ready(function () {
          $("a").click(function () {
              alert("是否确定要执行操作");

          })
      })
  </script>


  <table border="1">
             <tr>
                 <td>ID</td>
                 <td>传感器ID</td>
                 <td>日期时间</td>
                 <td>采样值</td>
                 <td>管理</td>
             </tr>

  <%

      int i = 0;
      try {
          Class.forName("com.mysql.jdbc.Driver");
      }catch (ClassNotFoundException e){
          System.out.println("加载数据库驱动错误");
          e.printStackTrace();
      }
      Connection conn = DriverManager.getConnection("");
      Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery("select * from test ");
      JSONObject object = new JSONObject();
      JSONArray array = new JSONArray();
      while(rs.next()){
          JSONObject ob = new JSONObject();
          i++;
          String color = "#D8BFD8";
          if(i % 2 == 0){
             color = "#DDA0DD";
          }
          String id = rs.getString(1);
          String sID = rs.getString(2);
          String markTime = rs.getString(3);
          String value = rs.getString(4);

          ob.element("id",id);
          ob.element("sID",sID);
          ob.element("markTime",markTime);
          ob.element("value",value);

          array.add(ob);
          %>
             <tr  bgcolor=<%=color %>>
                     <td><%=id %></td>
                     <td><%=sID %></td>
                     <td><%=markTime %></td>
                     <td><%=value %></td>
                 <td><a href="edit.jsp?id=<%= id %>">修改</a> &nbsp;
                      <a href="del.jsp?id=<%= id %>"onclick="return confirm('确定要删除吗')"> 删除</a> </td>
                 </tr>
              <%
      }
      object.element("historyDate",array);
      out.print(object.toString());
      rs.close();
      stmt.close();
      conn.close();
  %>

      <script type = "text/javascript">
          $(function () {
              //2018-01-07 09:54:12
              //2019-06-06 T 09:16:04 +0800
              var data = <%=object.toString() %>;
              var dataFortest = {"datapoints":[{"at":"2015-02-26T08:12:01Z","value":"14.0"},{"at":"2015-02-26T09:12:01Z","value":"14.9"}]}
              var dataForChart = DataAnalysis(data);
              showChart('#curve','spline','',false,eval(dataForChart));

          });
      </script>

      <p>在此处显示曲线图：</p>
      <div id="curve">

      </div>

      <br><br>添加传感器:<br><br>
      <form action="add.jsp" method="post">
          传感器:<input type="text" name="sID"><br><br>
          日期时间:<input type="text" name="markTime"><br><br>
          采样值:<input type="text" name="value"><br><br>
          <input type="submit" value="提交">&nbsp;&nbsp;&nbsp;
          <input type="reset" value="取消">
      </form>


  </body>
</html>
