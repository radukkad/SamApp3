<%@include file="init-datasource.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Active VM Sessions Report</title>
 </head>

<body>
  <div class=header>
    <div class="head">
      <div class="head-logo"><img src="images/eyes.png" /></div>
      <div class="head-text"><h2>Active VM Sessions Report</h2><br></div>
    </div>
  </div>
  <div class="content">
      <%
      
      try {
          Statement statement = connection.createStatement();
          String sql = "SELECT VMNAME,SUM(FLAG) as TOTAL FROM VMSESSIONS GROUP BY VMNAME";
          ResultSet resultSet = statement.executeQuery(sql);
      
        %>      
            <table border="1">
              <tr bgcolor="#00FF00">
                <th>Virtual Machine Instance</th>
                <th>Number of Active Sessions </th>
              </tr>
        <%
          
          while (resultSet.next()) {
              %>
              <tr>
              <td><%= resultSet.getString("VMNAME") %></td>
              <td><%= resultSet.getString("TOTAL") %></td>
            </tr>
              <%
          }
          
          %>
          </table>
          <%
          
          statement.close();
      } catch (Exception e) {
          e.printStackTrace();
      }
      
      %>
   </div>
</body>
</html>

<%
  try {
      connection.close();
  } catch (Exception e) {
      e.printStackTrace();
  }
%>
