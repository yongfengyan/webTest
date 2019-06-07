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
    <title>修改传感器</title>
  </head>
  <body>
  YYF

          <%
              String id = request.getParameter("id");
      try {
          Class.forName("com.mysql.jdbc.Driver");
      }catch (ClassNotFoundException e){
          System.out.println("加载数据库驱动错误");
          e.printStackTrace();
      }
      Connection conn = DriverManager.getConnection("jdbc:mysql://mysql.c12s2.cn/test?useUnicode=true&characterEncoding=UTF-8&useSSL=false","root","#!TB3#IRnW8!gq#r");
      String sql = "select * from test where id = ? ";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1,Integer.parseInt(id));
      ResultSet rs = pstmt.executeQuery();
      while(rs.next()){
          String sID = rs.getString(2);
          String markTime = rs.getString(3);
          String value = rs.getString(4);
          %>
  修改传感器:<br><br>
  <form action="edit_do.jsp" method="post">
      <input type = "hidden" name = "id" value="<%=id %>">
      传感器:<input type="text" name="sID" value="<%=sID %>"><br><br>
      日期时间:<input type="text" name="markTime" value="<%=markTime %>"><br><br>
      采样值:<input type="text" name="value" value="<%=value%>"><br><br>
      <input type="submit" value="提交">&nbsp;&nbsp;&nbsp;
      <input type="reset" value="取消">
  </form>
          <%
      }
      rs.close();
      pstmt.close();
      conn.close();;
  %>
  </body>
</html>
