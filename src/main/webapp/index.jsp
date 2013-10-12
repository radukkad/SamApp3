<%@include file="init-datasource.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Active VM Sessions Report</title>
 </head>

<body>
      <%
	  String tempVmName = "";
          
      try {
          Statement statement = connection.createStatement();
          String sql = "SELECT VMNAME,SUM(FLAG) as TOTAL FROM VMSESSIONS GROUP BY VMNAME";
          ResultSet resultSet = statement.executeQuery(sql);
      
          
          int tempTotal = 10;
		  while (resultSet.next()) {
            
			String vmname = resultSet.getString("VMNAME");
            String total= resultSet.getString("TOTAL");
            
			int totalInt = Integer.parseInt(total);
			if(totalInt < tempTotal)
			{
				tempVmName = vmname;
				tempTotal = totalInt;
			}
		  }
		  
        
          statement.close();
      } catch (Exception e) {
          e.printStackTrace();
      }
      
      %>
    <iframe src="http://<%=tempVmName%>.engr.sjsu.edu:8080/testapp/index.jsp"  width="600" height="600" frameBorder="0"></iframe> 

</body>
</html>

<%
  try {
      connection.close();
  } catch (Exception e) {
      e.printStackTrace();
  }
%>
