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
    <title>删除传感器数据</title>
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
      String sql="delete from test where id = ?";
      PreparedStatement stmp=conn_insert.prepareStatement(sql);
      request.setCharacterEncoding("UTF-8");
      String id = request.getParameter("id");
      try {
          stmp.setString(1,id);
          int n=stmp.executeUpdate();
          if(n==1){
  %>数据删除操作成功!<%
  }else{ %>数据删除操作失败!<%}
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
