package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.http.impl.client.*;
import org.apache.http.client.*;
import org.apache.http.client.methods.*;
import org.apache.http.util.*;
import org.apache.http.*;
import com.vmware.vim25.*;
import com.vmware.vim25.mo.Folder;
import com.vmware.vim25.mo.InventoryNavigator;
import com.vmware.vim25.mo.ServiceInstance;
import com.vmware.vim25.mo.Task;
import com.vmware.vim25.mo.VirtualMachine;
import com.vmware.vim25.mo.ManagedEntity;

import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import javax.sql.DataSource;
import javax.naming.InitialContext;
import javax.naming.Context;


public class VMController extends HttpServlet {

private HttpClient client = new DefaultHttpClient();

private final String USER_AGENT = "Mozilla/5.0";

Context initContext = null;
Context envContext  = null;
DataSource dataSource = null;
Connection con = null;

private Connection getConnection()  throws Exception 
{
      initContext = new InitialContext();
		envContext  = (Context)initContext.lookup("java:/comp/env");
		dataSource = (DataSource)envContext.lookup("jdbc/mysql-datasource");
		return dataSource.getConnection();
}

private void performUpdate(Connection con,String sql)  throws Exception
{
  try
  {
    Statement stmt = con.createStatement();
    stmt.executeUpdate(sql);
    stmt.close();
  }
  catch(Exception e)
  {
    e.printStackTrace();
  }
 
  
 }
public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
  doPost(request,response);
} 
public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
 
     
      final PrintWriter out = response.getWriter();
        StringBuffer sb = null;
       
        try {
        
        
        con = getConnection();
        
         String action = request.getParameter("action");
         String vmName = request.getParameter("vmName");
         
         
         sb = new StringBuffer("<br/>Team-6 VM Info, Name: "+ vmName +"<br/>");
         sb.append("***********************").append("<br/>");

        String msg="";
        
        VMLib vmlib = new VMLib(); 
        
        if(action != null && action.equals("start"))
        {  
        msg = vmlib.initializeVM(vmName);
        msg = vmlib.getPowerState(vmName);
        sb.append("Status "+ msg);
              
         if(msg != null &&  msg.trim().equals("poweredOff"))
         {
            msg = vmlib.powerOn(vmName);
         }
         
         String updSql = "UPDATE VMCONF SET USED=1 WHERE VMHOSTNAME='"+ vmName +"'";
         out.println("updSql="+ updSql);
         performUpdate(con, updSql);
       
         String insSql = "INSERT INTO VMSESSIONS VALUES('"+ vmName +"',0)";
         out.println("updSql="+ insSql);
         performUpdate(con, insSql);
       
         
         
        }
        else if (action != null && action.equals("stop"))
        {
        msg = vmlib.initializeVM(vmName);
        msg = vmlib.getPowerState(vmName);
        sb.append("Status "+ msg);
        
          if(msg != null && msg.trim().equals("poweredOn"))
          {
            msg = vmlib.powerOff(vmName);
          }
          String updSqlVMConf = "UPDATE VMCONF SET USED=0 WHERE VMHOSTNAME='"+ vmName +"'";
          performUpdate(con,updSqlVMConf);
          
           String delSql = "DELETE FROM VMSESSIONS WHERE VMNAME='"+ vmName +"'";
           out.println("delSql="+ delSql);
           performUpdate(con, delSql);

          
        }
        else if (action != null && action.equals("clone"))
        {
        
          vmlib.cloneVM(vmName);
          vmlib.initializeVM(vmName);
          vmlib.powerOn(vmName);
          
        
        }
        else if (action != null && action.equals("configip"))
        {
			String ipaddr = request.getParameter("ipaddr");
			String dns = request.getParameter("dns");
			String hostname = request.getParameter("hostname");
			sb.append("ipaddr : "+ipaddr+ " dns = "+dns +"hostname="+ hostname +"<br/>");  
			vmlib.configureNetwork(vmName,ipaddr,dns,hostname);
			
        }
        
        
        
        sb.append("VM : "+vmName+ " Power State = "+msg+"<br/>");  
 
       // vmlib.finalize();
 
        } catch (Exception ex) {
            sb = new StringBuffer(ex.toString());
        }
        finally
        {
         try{con.close();}catch(Exception e){} 
        }
        
       out.println(sb.toString());
       
       
        String  returnURL = request.getParameter("returnURL");

    if(returnURL != null && returnURL != "")
     {
        //  request.getRequestDispatcher(returnURL).forward(request, response);
         response.sendRedirect(returnURL);
       }
    }
    
 
  public void init() throws ServletException
  {
      // Do required initialization
  }
 
  
  public void destroy()
  {
      // do nothing.
  }
}