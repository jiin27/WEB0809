<%@page contentType="text/html;charset=utf-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%
/*java se의 기술을 적용할 수 있다
	String (o)
	Swing (x)(Swing은 윈도우 프레임을 사용하므로)
	ArrayList (o)
*/

//웹브라우저로부터 데이터를 전송받아서, 회원정보에 넣기

//전송 파라미터(변수) 값 받기
String id=request.getParameter("id"); //getParameter : html 문서의 파라미터 변수명을 가져오는 것
String name=request.getParameter("name");
String phone=request.getParameter("phone");

//드라이버 로드
String url="jdbc:oracle:thin:@localhost:1521:XE";
String user="java";
String pass="1234";
Connection con=null;
PreparedStatement pstmt=null;

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection(url, user, pass);
	if(con!=null){
		out.print("드라이버 접속 성공 ");
		String sql="insert into member(member_idx, id, name, phone)";
		sql+=" values(seq_member.nextval, ?, ?, ?)";
		pstmt=con.prepareStatement(sql);

		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, phone);

		int result=pstmt.executeUpdate(); //DML 실행
		if(result>0){
			out.print("db 등록 성공");
		}
	}
}catch(ClassNotFoundException e){
	out.print("드라이버가 없습니다.");
}finally{
	if(pstmt!=null){
		try{pstmt.close();}catch(SQLException e){}
	}
		if(con!=null){
		try{con.close();}catch(SQLException e){}
	}

}
%>