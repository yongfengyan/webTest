<%--
  Created by IntelliJ IDEA.
  User: YYF
  Date: 2019/5/16
  Time: 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" pageEncoding="UTF-8" %>

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
      Connection conn_insert = DriverManager.getConnection("jdbc:mysql://mysql.c12s2.cn/test?useUnicode=true&characterEncoding=UTF-8&useSSL=false","root","#!TB3#IRnW8!gq#r");
      String sql="update test set sID=?,sDateTime=?,sValue=? where id = ?";
      PreparedStatement stmp=conn_insert.prepareStatement(sql);
      request.setCharacterEncoding("UTF-8");
      String id = request.getParameter("id");
      String sID = request.getParameter("sID");
      String sDateTime = request.getParameter("markTime");
      float sValue = Float.parseFloat(request.getParameter("value"));

      try {
          stmp.setString(1,sID);
          stmp.setString(2,sDateTime);
          stmp.setFloat(3,sValue);
          stmp.setString(4,id);
          int n=stmp.executeUpdate();
          if(n==1){
  %>数据修改操作成功!<%
  }else{ %>数据修改操作失败!<%}
      if(stmp!=null){
          stmp.close();
      }
      if(conn_insert!=null){
          conn_insert.close();
      }
      } catch (SQLException e) {
          e.printStackTrace();
      }


  %>


  </body>
</html>
