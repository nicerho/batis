<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%
    //CORS 해결하는 response 메서드
    response.addHeader("Access-Control-Allow-Origin","*"); // Access-Control-Allow-Origin는 도메인 명 * 는 모든 도메인에서 허용
    response.addHeader("Access-Control-Allow-Credentials","true");//Access-Control-Allow-Credentials : true 또는 false(도메인에 대한 인증요청)
    %>
${mid}