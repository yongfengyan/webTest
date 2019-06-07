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
  <script type="text/javascript">
      function test(){
          var name=document.getElementById("name").value;
          $.ajax({
              type:"GET", //请求方式
              url:"/date/history.do", //请求路径
              cache: false,
              data:"name="+name,  //传参
              dataType: 'json',   //返回值类型
              success:function(msg){
                  var me=msg[0];
                  var me=msg[0].userName;
                  for(i in msg){
                      var me1=msg[i];
                  }

              },
              error:function(){
                  alert("error");
              }
          });
      }
  </script>

  <form action="" method="post" >
      <input type="text" name="name" id="name" value="name">
      <input type="button" name="b" value="测试" onclick=test()>
  </form>


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
