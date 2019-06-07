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
    <title>YYF</title>
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
      String sql="insert into book(id,bname,price)values(?,?,?)";
      PreparedStatement stmp=conn_insert.prepareStatement(sql);
      request.setCharacterEncoding("UTF-8");
      int id = Integer.parseInt(request.getParameter("id"));
      String bname = request.getParameter("name");
      int price = Integer.parseInt(request.getParameter("price"));
      stmp.setInt(1,id);
      stmp.setString(2,bname);
      stmp.setInt(3,price);
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
