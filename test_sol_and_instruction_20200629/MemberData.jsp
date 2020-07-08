<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%!
Connection con;
Statement st;
ResultSet rs;
String driver ="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String uid="system";
String upw="1234";
String query="select * from v_sale";
%>

<%
try{
	Class.forName(driver);
	con = DriverManager.getConnection(url, uid, upw);
	st = con.createStatement();
	rs = st.executeQuery(query);
	
	while(rs.next()){
		int saleno=rs.getInt("saleno");
		String pcode = rs.getString("pcode");
		String saledate = rs.getString("saledate");
		String scode = rs.getString("scode");
		String name = rs.getString("name");
		int amount = rs.getInt("amount");
		int sub_total = rs.getInt("sub_total");
		out.println("���ȣ: "+ saleno +
				",   ��ǰ�ڵ�: "+ pcode +
				",   �Ǹų���: "+ saledate +
				",   �����ڵ�: "+ scode +
				",   ��ǰ��: "+ name +
				",   �Ǹż���: "+ amount +
				",   ���Ǹž�: "+ sub_total +
				
				
				
				"<br/>"
				);
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	try{
		if(rs != null) rs.close();
		if(st != null) st.close();
		if(con != null) con.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}

%>

</body>
</html>