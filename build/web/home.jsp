<%-- 
    Document   : home
    Created on : Oct 18, 2023, 8:29:13 AM
    Author     : ThuyVy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<c:if test="${account==null}">
    
    
</c:if>--%>
<c:choose>
    <c:when test="${account.isAdmin == true}">
        <!--<p>Admin</p>-->
        <%@include file="admin.jsp" %>
    </c:when>
    <c:otherwise>
        <!--<p>User</p>-->
        <%@include file="user.jsp" %>
    </c:otherwise>
</c:choose>

