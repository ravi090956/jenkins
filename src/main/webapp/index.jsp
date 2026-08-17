i<%@ page import="java.sql.*,java.util.*" %>

<html>
<body>

<h2><%= request.getParameter("msg") %></h2>

<%
    String password = "admin1r490523"; // Hardcoded credential

    Connection conn = null;
    Statement stmt = null;

    try {
        String userInput = request.getParameter("id");

        conn = DriverManager.getConnection(
            "jdbc:mysql://localhost/test",
            "root",
            "root"
        );

        stmt = conn.createStatement();

        // SQL Injection vulnerability
        ResultSet rs = stmt.executeQuery(
            "SELECT * FROM users WHERE id='" + userInput + "'"
        );

        while(rs.next()) {
            out.println(rs.getString("name"));
        }

        // Null pointer issue
        String str = null;
        out.println(str.length());

    } catch(Exception e) {
        // Empty catch block
    }

    // Dead code
    if(false) {
        out.println("Never executed");
    }

    // Unused variable
    int unusedVariable = 100;

    // Duplicate strings
    out.println("TEST");
    out.println("TEST");
    out.println("TEST");

%>

</body>
</html>
