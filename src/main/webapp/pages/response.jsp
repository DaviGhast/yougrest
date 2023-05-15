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
    
	    <table border="1">
	        <tr>
	            <td>ID</td>
	            <td>Name</td>
	            <td>Year</td>
	        </tr>
	        
            <c:forEach var="res" items="${result}">
                
                <tr>
		            <td>${res.id}</td>
		            <td>${res.name}</td>
		            <td>${res.year}</td> 
	        	</tr>
                
            </c:forEach>
        
        </table>
         

    </c:if>
    
    
  </body>
</html>