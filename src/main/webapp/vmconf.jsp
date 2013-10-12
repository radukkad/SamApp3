<%@include file="init-datasource.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="refresh" content="10"> <!-- Refresh every 15 minutes -->
  <title>Group 6 Test VM Administration Console</title>
  
  
  <link rel="stylesheet" href="style.css" type="text/css">
        <script src="../scripts/amcharts.js" type="text/javascript"></script>        
        <script type="text/javascript">
            var chart;
    var chartData = [
      <%
           try {
          Statement stmt1 = connection.createStatement();
          String sqlOne = "SELECT VMNAME,SUM(FLAG) as TOTAL FROM VMSESSIONS GROUP BY VMNAME";
          ResultSet rs1= stmt1 .executeQuery(sqlOne );
        
          while (rs1.next()) {
          
              %>
      { vmname: '<%= rs1.getString("VMNAME") %>', livesessions: <%= rs1.getString("TOTAL") %> <% if(!rs1.isLast()) {%>},<%} else {%>}<%}%>
    
       <%
          }
          rs1.close();
           stmt1.close();
      } catch (Exception e) {
          e.printStackTrace();
      }
      
      %>
            ];
           AmCharts.ready(function () {
                // SERIAL CHART
                chart = new AmCharts.AmSerialChart();
                chart.dataProvider = chartData;
                chart.categoryField = "vmname";
                // this single line makes the chart a bar chart, 
                // try to set it to false - your bars will turn to columns                
                chart.rotate = true;
                // the following two lines makes chart 3D
                chart.depth3D = 10;
                chart.angle = 30;

                // AXES
                // Category
                var categoryAxis = chart.categoryAxis;
                categoryAxis.gridPosition = "start";
                categoryAxis.axisColor = "#DADADA";
                categoryAxis.fillAlpha = 1;
                categoryAxis.gridAlpha = 0;
                categoryAxis.fillColor = "#FAFAFA";

                // value
                var valueAxis = new AmCharts.ValueAxis();
                valueAxis.axisColor = "#DADADA";
                valueAxis.title = "Number of live sessions";
                valueAxis.gridAlpha = 1;
                valueAxis.precision = 0;
                chart.addValueAxis(valueAxis);

                // GRAPH
                var graph = new AmCharts.AmGraph();
                graph.title = "Live sessions";
                graph.valueField = "livesessions";
                graph.type = "column";
                graph.balloonText = "Live sessions in [[category]]: [[value]]";
                graph.lineAlpha = 0;
                graph.fillColors = "#bf1c25";
                graph.fillAlphas = 1;
                chart.addGraph(graph);

                // WRITE
                chart.write("chartdiv");
            });
        </script>
  
 

  
  <style type="text/css">
    table.gridtable {
      font-family: verdana,arial,sans-serif;
      font-size:11px;
      color:#333333;
      border-width: 1px;
      border-color: #666666;
      border-collapse: collapse;
    }
    table.gridtable th {
      border-width: 1px;
      padding: 8px;
      border-style: solid;
      border-color: #666666;
      background-color: #dedede;
    }
    table.gridtable td {
      border-width: 1px;
      padding: 8px;
      border-style: solid;
      border-color: #666666;
      background-color: #ffffff;
    }
    
    .button {
    border: 1px solid #006;
    background: #9cf;
    }
    </style>

 </head>

<body>
  <div class=header>
    <div class="head">
      <div class="head-logo"></div>
      <div class="head-text"><h2>Group 6 VM Administration Console</h2><br></div>
    </div>
  </div>
  <div class="content">
      <%
      
      try {
          Statement statement = connection.createStatement();
          String sql = "SELECT VMHOSTNAME,IPADDRESS,DNSNAME,NETMASK,GATEWAY,DNS1,DNS2,USED FROM VMCONF";
          ResultSet resultSet = statement.executeQuery(sql);
      
        %>      
            <table border="1" class="gridtable">
              <tr bgcolor="#00FF00">
                <th>VM Name</th>
                <th>IP Address</th>
                <th>DNS Name</th>
                <th>Netmask</th>
                <th>Gateway</th>
                <th>DNS1</th>
                <th>DNS2</th>
                <th>Status</th>
                <th></th>
              </tr>
        <%
          
          while (resultSet.next()) {
              %>
              <tr>
              <td><%= resultSet.getString("VMHOSTNAME") %></td>
              <td><%= resultSet.getString("IPADDRESS") %></td>
              <td><%= resultSet.getString("DNSNAME") %></td>
              <td><%= resultSet.getString("NETMASK") %></td>
              <td><%= resultSet.getString("GATEWAY") %></td>
              <td><%= resultSet.getString("DNS1") %></td>
              <td><%= resultSet.getString("DNS2") %></td>
              <td><%
                  String result = resultSet.getString("USED");
                  if(result.equals("1"))
                    {
                    %>
                    Active
                  <%
                    }
                    else if(result.equals("0"))
                    {
                %>
                     Down
                  <%
                    }
                      else
                      {
                      %>
                       Unavailable
                      <%
                      }
                      
                  %> </td>
                <td>
                  <%
                  if(result.equals("1"))
                    {    
                  %>
                  <form action='http://samapp3.aws.af.cm/VMController' method='POST'>
                   <input type='submit' name='Stop' value='Stop'/>
                    <input type='hidden' name='vmName' value='<%= resultSet.getString("VMHOSTNAME") %>'/> 
                    <input type='hidden' name='action' value='stop'/> 
                    <input type='hidden' name='returnURL' value='/vmconf.jsp'/> 
                  </form>
                  <%
                  }
                  else if(result.equals("0"))
                  {
                  %>
                  &nbsp; <form action='http://samapp3.aws.af.cm/VMController' method='POST'>
                   <input type='submit' name='Start' value='Start'/>
                    <input type='hidden' name='vmName' value='<%= resultSet.getString("VMHOSTNAME") %>'/>
                    <input type='hidden' name='action' value='start'/>  
                  <input type='hidden' name='returnURL' value='/vmconf.jsp'/> 
                  </form>
                  <%
                  }
                  %></td>
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

  <div id="chartdiv" style="width: 500px; height: 600px;"></div>
  </body>
</html>

<%
  try {
      connection.close();
  } catch (Exception e) {
      e.printStackTrace();
  }
%>
