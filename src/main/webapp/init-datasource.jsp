<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>

<%@include file="datasource-config.jsp" %>

<%
String DATASOURCE_INITIAL_SQL = "../webapps/datasource/init-datasource.sql";

Context initContext = null;
Context envContext  = null;
DataSource dataSource = null;
Connection connection = null;

try {
    initContext = new InitialContext();
    envContext  = (Context)initContext.lookup("java:/comp/env");
    dataSource = (DataSource)envContext.lookup(DATASOURCE_NAME);
    connection = dataSource.getConnection();
    
    try {
        File f = new File(DATASOURCE_INITIAL_SQL);
        
        FileInputStream fIn = new FileInputStream(f);
        byte []buff = new byte[fIn.available()];
        fIn.read(buff);
        String sql = new String(buff);
        
        String []sqls = sql.split(";");
        for (int i = 0; i < sqls.length; i++) {
            String sq = sqls[i].trim();
            if (sq.isEmpty()) {
                continue;
            }
            
            Statement statement = connection.createStatement();
            statement.executeUpdate(sq);
            statement.close();
        }
        
    } catch (Exception e) {
        String errorMessage = e.getMessage();
        if (errorMessage.indexOf("Table") >= 0 &&
            errorMessage.indexOf("already exists") >= 0) {
            System.out.println("All OK. No need no init database");
        }
    }
} catch (Exception e) {
    response.sendRedirect("datasource-error.jsp");
}

%>
