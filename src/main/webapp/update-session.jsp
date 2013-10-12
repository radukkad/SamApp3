<%@page import="java.net.URLDecoder"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="init-datasource.jsp" %>
<%
    String action = request.getParameter("action");
    String vmName = request.getParameter("vmName");
    
    action = URLDecoder.decode(action);
    vmName = URLDecoder.decode(vmName);
    
    String updSql = "";
    
    if(action != null && action.equals("add"))
    {
       updSql  = "INSERT INTO VMSESSIONS (VMNAME, FLAG)  VALUES ('"+ vmName +"', 1)";
    }
    else
    {
       updSql  = "INSERT INTO VMSESSIONS (VMNAME, FLAG)  VALUES ('"+ vmName +"', -1)";
    }
      
    try {
        Statement statement = connection.createStatement();
        statement.executeUpdate(updSql);
        statement.close();        
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    //response.sendRedirect("employees.jsp");

%>

<h1>Update done </h1>
<%
  try {
      connection.close();
  } catch (Exception e) {
      e.printStackTrace();
  }
%>
