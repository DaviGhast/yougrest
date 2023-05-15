<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib uri="/struts-tags" prefix="s" %>

<%@	page import="java.util.ArrayList" %>
<%@	page import="java.util.HashMap" %>

<html>
  <head>
    <meta charset="UTF-8">
    <title>Basic Struts 2 Application - Welcome</title>
    
    
    
  </head>
  <body>
    <h1>Welcome To Struts 2!</h1>
    
    <c:if test="${not empty result}">
    
    	<h2>${result}</h2>
    
	    <c:forEach var="res" items="${result}">
                
                <h3>${res.user_exists}</h3>
                
            </c:forEach>
         

    </c:if>
    
    
  </body>
</html>