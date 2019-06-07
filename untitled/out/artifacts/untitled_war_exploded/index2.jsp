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
  请填写需要插入的数据:<br><br>
  <form action="insert.jsp" method="post">
      ID:<input type="text" name="id"><br><br>
      书名:<input type="text" name="name"><br><br>
      价格:<input type="text" name="price"><br><br>
      <input type="submit" value="提交">&nbsp;&nbsp;&nbsp;
      <input type="reset" value="取消">
  </form>

  <table border="1">
             <tr>
                 <td>name</td>
                 <td>price</td>
             </tr>
  <%
      try {
          Class.forName("com.mysql.jdbc.Driver");
      }catch (ClassNotFoundException e){
          System.out.println("加载数据库驱动错误");
          e.printStackTrace();
      }
      Connection conn = DriverManager.getConnection("jdbc:mysql://mysql.c12s2.cn/test?useUnicode=true&characterEncoding=UTF-8&useSSL=false","root","#!TB3#IRnW8!gq#r");
      Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery("select * from book ");
      while(rs.next()){
          out.println(rs.getString(2));
          String test1 = rs.getString(2);
          String test2 = rs.getString(3);
          %>
             <tr>
                     <td><%=test1 %></td>
                     <td><%=test2 %></td>

                 </tr>
              <%
      }
      rs.close();
      stmt.close();
      conn.close();;
  %>
  </body>
</html>
