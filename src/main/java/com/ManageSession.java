package com;


import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.apache.http.impl.client.*;
import org.apache.http.client.*;
import org.apache.http.client.methods.*;
import org.apache.http.util.*;
import org.apache.http.*;

import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import javax.sql.DataSource;
import javax.naming.InitialContext;
import javax.naming.Context;

import com.ning.http.client.*;
import java.util.concurrent.Future;
import java.util.*;

import org.apache.log4j.Logger;

// test comment
public class ManageSession extends HttpServlet {

private static Logger logger = Logger.getLogger(ManageSession.class);
private HttpClient client = new DefaultHttpClient();

private final String USER_AGENT = "Mozilla/5.0";

Context initContext = null;
Context envContext  = null;
DataSource dataSource = null;
Connection con = null;
AsyncHttpClient asyncHttpClient = null;

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

public void service(ServletRequest request, final ServletResponse response) 
    throws ServletException, IOException {
	
	final PrintWriter out = response.getWriter();
	String action = request.getParameter("action");
    final String vmName = request.getParameter("vmName");
    

    try 
	{
	
    con = getConnection();
		out.println("action="+ action);
        out.println("vmName="+ vmName);
              
        String updSql = "";
    
        if(action != null && action.equals("add"))
        {
			updSql  = "INSERT INTO VMSESSIONS (VMNAME, FLAG)  VALUES ('"+ vmName +"', 1)";
		}
        else
        {
			updSql  = "INSERT INTO VMSESSIONS (VMNAME, FLAG)  VALUES ('"+ vmName +"', -1)";
        }
          
        performUpdate(con, updSql);
        
        //out.println("updSql="+ updSql);
		    //Statement stmt1 = connection.createStatement();
        //stmt1.executeUpdate(updSql);
        //stmt1.close();    
        //out.println("update done");    
       
		if(action != null && action.equals("add"))
		{
			boolean chkUpResult = checkUpSessions(con,out);
     		out.println("chkUpResult="+ chkUpResult);
     		if(chkUpResult)
     		{
				out.println("Need to start creating a new VM ");
				try
				{		
					Map vmConf = getNextAvailableVMConf(0);
					if(vmConf != null && vmConf.size() > 0)
					{
					final String nextVmName = (String)vmConf.get("VMHOSTNAME");
				
          asyncHttpClient.prepareGet("http://samapp3.aws.af.cm/VMController?vmName="
            + nextVmName+"&action=start").execute(new AsyncCompletionHandler(){
						@Override
						public Response onCompleted(Response response) throws Exception
						{
              Connection con2 = getConnection();
							out.println("VM started successfully, now insert record into VMSESSIONS table"); 
							String insSql = "INSERT INTO VMSESSIONS(VMNAME,FLAG) values('"+ nextVmName +"',0)";
						  out.println("insSql="+ insSql);
							performUpdate(con2, insSql);
              
              con2.close();
							return response;
						}
              
						@Override
						public void onThrowable(Throwable t)
						{
							
						}
            
					});
     
			}
		else
		{
          	Map cloneVmConf = getNextAvailableVMConf(2);
					  if(cloneVmConf != null && cloneVmConf.size() > 0)
					  {
					    final String cloneVmName = (String)cloneVmConf.get("VMHOSTNAME");
				    
           
            asyncHttpClient.prepareGet("http://samapp3.aws.af.cm/VMController?vmName="
            + cloneVmName+"&action=clone").execute(new AsyncCompletionHandler(){
						@Override
						public Response onCompleted(Response response) throws Exception
						{
              Connection con2 = getConnection();
							out.println("VM started successfully, now insert record into VMSESSIONS table"); 
							
              String updSql = "UPDATE VMCONF SET USED=1 WHERE VMHOSTNAME='"+ cloneVmName +"'";
              out.println("updSql="+ updSql);
              performUpdate(con2, updSql);
             
              String insSql = "INSERT INTO VMSESSIONS(VMNAME,FLAG) values('"+ cloneVmName +"',0)";
						  out.println("insSql="+ insSql);
							performUpdate(con2, insSql);
        
              con2.close();
							return response;
						}
              
						@Override
						public void onThrowable(Throwable t)
						{
							//out.println("Error happend while calling VMController servlet");
						}
            
					});	
       } 
       }
             	}
				catch(Exception e)
				{
					out.println("Exception happend while calling VMController servlet");
					e.printStackTrace();
				}	
			} 
   
		}
		else if(action != null && action.equals("remove"))
		{
			out.println("Remove action");
			boolean chkDownResult = checkDownSessions(con,out,vmName);
			out.println("chkDownResult="+ chkDownResult);
			if(chkDownResult)
			{
				out.println("Time to stop aa VM - Downscale");
				try
				{
					// first delete the entry from the db
					String delSql = "DELETE FROM VMSESSIONS WHERE VMNAME= '"+ vmName +"'";
					performUpdate(con, delSql);
					// Now send a request to stop the VM
     
          String updSqlVMConf = "UPDATE VMCONF SET USED=0 WHERE VMHOSTNAME='"+ vmName +"'";
          performUpdate(con,updSqlVMConf);
         
					AsyncHttpClient asyncHttpClient = new AsyncHttpClient();
					asyncHttpClient.prepareGet("http://samapp3.aws.af.cm/VMController?vmName="+ vmName +"&action=stop").execute(new AsyncCompletionHandler(){
			  
						@Override
						public Response onCompleted(Response response) throws Exception
						{
							out.println("VM stop request issued successfully"); 
							return response;
						}
						
						@Override
						public void onThrowable(Throwable t)
						{
							out.println("Error happend while calling VMController servlet");
						}
					});
          
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
		}
	
  }
	catch(Exception e)
	{	
		e.printStackTrace();
	}
  finally
  {
    try{con.close();}catch(Exception e){}
  }
	
	out.println("<h1>End of response !!!</h1>");
}

public void init() throws ServletException
{
	asyncHttpClient = new AsyncHttpClient(new AsyncHttpClientConfig.Builder().setRequestTimeoutInMs(900000).build());
  }
 
  
 public void destroy()
 {
    
 }
 private Map getNextAvailableVMConf(int state)
 {
   Map resultMap = new HashMap();
   try
   {
     Statement stmt6 = con.createStatement();
     String sql = "select * from VMCONF WHERE USED="+ state+" ORDER BY VMHOSTNAME";
     
     ResultSet resultSet = stmt6.executeQuery(sql);
     resultMap.clear();
	 while (resultSet.next()) {
			String vmname = resultSet.getString("VMHOSTNAME");
			String ipaddress = resultSet.getString("IPADDRESS");
			String dnsname = resultSet.getString("DNSNAME");
			String netmask = resultSet.getString("NETMASK");
			String gateway = resultSet.getString("GATEWAY");
			String dns1 = resultSet.getString("DNS1");
			String dns2 = resultSet.getString("DNS2");
			
			resultMap.put("VMHOSTNAME", vmname);
			resultMap.put("IPADDRESS", ipaddress);
			resultMap.put("DNSNAME", dnsname);
			resultMap.put("NETMASK", netmask);
			resultMap.put("GATEWAY", gateway);
			resultMap.put("DNS1", dns1);
			resultMap.put("DNS2", dns2);
			
			break;
		}
       stmt6.close();
   }
   catch(Exception e)
   {
     e.printStackTrace();
   }
   
   return resultMap;
 }
  
 public boolean checkDownSessions(Connection con,PrintWriter out,String vmName) throws Exception
 {
  	
	boolean zeroFlag = false;  
	boolean redUsageFlag = false;  
	try 
	{
   	Statement stmt5 = con.createStatement();
		String sql = "SELECT VMNAME,SUM(FLAG) as TOTAL FROM VMSESSIONS GROUP BY VMNAME";
        ResultSet resultSet = stmt5.executeQuery(sql);
		while (resultSet.next()) {
			String vmname = resultSet.getString("VMNAME");
			String totalStr= resultSet.getString("TOTAL");
			int total = Integer.parseInt(totalStr);
            if(vmname.equals(vmName) && total <=0 )
			{
				zeroFlag = true;
        out.println("VMName="+ vmname+ ", total="+ total +", zeroFlag=true");
            }
			else if(total <2)
			{
				redUsageFlag = true;
        out.println("VMName="+ vmname+ ", total="+ total+", redUsageFlag=true");
			}	
      else
      {
        out.println("VMName="+ vmname+ ", total="+ total);
      }
		}
        stmt5.close();
        
	} 
	catch (Exception e) 
	{
		e.printStackTrace();
  }
	   
    return zeroFlag && redUsageFlag;
}
  
private boolean checkUpSessions(Connection con,PrintWriter out)  throws Exception 
{
	boolean topFlag = false;
  boolean availFlag = false;
    try 
	{
		Statement stmt6 = getConnection().createStatement();
		String sql = "SELECT VMNAME,SUM(FLAG) as TOTAL FROM VMSESSIONS GROUP BY VMNAME";
        ResultSet resultSet = stmt6.executeQuery(sql);
        while (resultSet.next()) 
		{
			String vmname = resultSet.getString("VMNAME");
			String totalStr= resultSet.getString("TOTAL");
            int total = Integer.parseInt(totalStr);
            if(total >= 2)
            {
            out.println("VMName="+ vmname+ ", total= "+ total +", topFlag=true");
				topFlag = true;
		      } else if(total < 2)
            {
            out.println("VMName="+ vmname+ ", total="+ total +", availFlag=true");
            availFlag = true;  
            }
            else
            {
              out.println("VMName="+ vmname + ", total="+ total);
            }
            
		}
        stmt6.close();
 } 
	catch (Exception e) {
		e.printStackTrace();
	}
	
    return topFlag && !availFlag;
	}
}