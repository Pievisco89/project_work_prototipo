<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    String DRIVER = "com.mysql.cj.jdbc.Driver";
    String URL = "jdbc:mysql://localhost:3306/project_work";
    String USERNAME = "root";
    String PASSWORD = "";
    String user = request.getParameter("email");
    String password = request.getParameter("password");
    boolean status = false;
    try {
        Class.forName(DRIVER);
        Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        String sel = ("SELECT email, password FROM amministratore");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sel);
        while (rs.next()) {
            if (rs.getString("email").equals(user) && rs.getString("password").equals(password)) {
                status = true;
            }
        }
        con.close();
    } catch (SQLException e) {
        e.getErrorCode();
    }
    if (status) {
        out.println("<h1>Login riuscita!</h1>");
    } else {
        out.println("<h1>Login NON riuscita!</h1>");
    }
%>
