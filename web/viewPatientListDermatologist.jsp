<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="doctorheaderDermatologist.html"%>
<html>
<head>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<br>
<%
    String msg=request.getParameter("msg");
    if("valid".equals(msg))
    {
%>
    <center><font color="red" size="5">Successfully Updated</font></center>
<%
    }
%>
<%
     if("invalid".equals(msg))
    {
%>
    <center><font color="red" size="5">Something went Wrong! Try Again !</font></center>
<%
    }
%>
<%
    if("deleted".equals(msg))
    {
%>
    <center><font color="red" size="5">Sucessfully Deleted</font></center> 
<%
    }
%>

<center>
    <table id="customers">
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Age</th>
            <th>Address</th>
            <th>Mobile Number</th>
            <th>Date</th>
            <th>Timing</th>
            <th>Gender</th>
            <th>Email</th>
            <th>Blood Group</th>
            <th>Specialist</th>
            <th>Done</th>
            <th>Delete</th>
        </tr>
        <tr>
            <%
                try
                {
                  Connection con=ConnectionProvider.getCon();
                  Statement st=con.createStatement();
                  ResultSet rs=st.executeQuery("select * from patient where specialist='Dermatologist' and status='pending'");
                  while(rs.next())
                  {
                      
            %>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
            <td><%=rs.getString(5)%></td>
            <td><%=rs.getString(6)%></td>
            <td><%=rs.getString(7)%></td>
            <td><%=rs.getString(8)%></td>
            <td><%=rs.getString(9)%></td>
            <td><%=rs.getString(10)%></td>
            <td><%=rs.getString(11)%></td>
            <td><a href="requestPatientDermatologistDone.jsp?mobilenumber=<%=rs.getString(5)%>">Done</a></td>
            <td><a href="requestPatientDeleteDermatologist.jsp?mobilenumber=<%=rs.getString(5)%>">Delete</a></td>
            </tr>
            <%
                  }
                }
                catch(Exception e)
                {
                    System.out.println(e);
                }
                
            %>
       
    </table>
</center>
<br>
<br>
<br>
<br>
</body>
</html>