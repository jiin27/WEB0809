<%@ page contentType="text/html;charset=utf-8"%>
<%
/* jsp는 Java Server Page를 의미하며, 이 jsp에 Java 코드를 작성할 수 있다. 
하지만 jsp는 클래스 파일이 아니므로 jsp만의 문법을 지켜서 코드를 작성해야 한다.*/
	String url="";
	String id="java";
	String pass ="1234";

	String str="Java Full Stack Developer";
	out.print(str);  //jsp는 결과값만 보여짐.  모든 소스가 원본으로 공개되는 프론트엔드 사이드에서는 중요한 데이터, 암호화된 데이터는 넣으면 안됨.
%>