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


public class SKServlet extends HttpServlet {

private HttpClient client = new DefaultHttpClient();

private final String USER_AGENT = "Mozilla/5.0";

protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        StringBuffer sb = null;
        try {
            String vmName = request.getParameter("name");
 
            sb = new StringBuffer("<br/>Team-6 VM Info, Name: "+ vmName +"<br/>");
            sb.append("***********************").append("<br/>");

        String msg="";
        //String vmName = "rajesh.adukkadakkath@sjsu.edu";
        //String vmName = "rajesh_clone_to_surya@sjsu.edu";
         VMLib vmlib = new VMLib(); 
         msg = vmlib.initializeVM(vmName);
         msg = vmlib.getPowerState(vmName);
         sb.append("VM : "+vmName+ " Power State = "+msg+"<br/>");  
 
        } catch (Exception ex) {
            sb = new StringBuffer(ex.toString());
        }
         /*VMManager object = new VMManager();
         String str=object.sayHello("Team-6-2nd-pkg-test");
         sb.append(str+"<br/>");
         */
          request.setAttribute("data", sb.toString());
          RequestDispatcher rd = request.getRequestDispatcher("/success.jsp");
          rd.forward(request, response);
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