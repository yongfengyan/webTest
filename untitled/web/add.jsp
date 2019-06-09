<%--
  Created by IntelliJ IDEA.
  User: YYF
  Date: 2019/5/16
  Time: 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" pageEncoding="UTF-8" %>
<%@ page import="java.text.SimpleDateFormat" %>

<html>
  <head>
    <title>添加传感器</title>
  </head>
  <body>
  YYF

  <%
      try {
          Class.forName("com.mysql.jdbc.Driver");
      }catch (ClassNotFoundException e){
          System.out.println("加载数据库驱动错误");
          e.printStackTrace();
      }
      Connection conn_insert = DriverManager.getConnection("");
      String sql="insert into test(sID,sDateTime,sValue)values(?,?,?)";
      PreparedStatement stmp=conn_insert.prepareStatement(sql);
      request.setCharacterEncoding("UTF-8");
      String sID = request.getParameter("sID");
     // String time = request.getParameter("time");
      java.util.Date ss = new java.util.Date();
      SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
      String markTime = format0.format(ss.getTime());
      float sValue = Float.parseFloat(request.getParameter("value"));
      stmp.setString(1,sID);
      stmp.setString(2,markTime);
      stmp.setFloat(3,sValue);
      int n=stmp.executeUpdate();
      if(n==1){
             %>数据插入操作成功!<%
      }else{ %>数据插入操作失败!<%}
      if(stmp!=null){
      stmp.close();
      }
      if(conn_insert!=null){
      conn_insert.close();
      }
  %>


  </body>
</html>
