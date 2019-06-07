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
  <script language="javascript" src="JS/jquery-1.11.0.min.js"></script>
  <script type="text/javascript">
      function test(){
          var name=document.getElementById("name").value;
          $.ajax({
              type:"GET", //请求方式
              url:"/date/history.do", //请求路径
              cache: false,
              data:"name="+name,  //传参
              dataType: 'json',   //返回值类型

              success: function(data){
               alert(data.toString());
              }
          });
      }
  </script>

  <form action="" method="post" >
      <input type="text" name="name" id="name" value="name">
      <input type="button" name="b" value="测试" onclick=test()>
  </form>


  YYF
  JSON TEST:<br><br>

  </body>
</html>
