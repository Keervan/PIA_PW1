<%-- 
    Document   : index
    Created on : 28/11/2020, 08:43:02 PM
    Author     : dykeo
--%>

<%@page import="com.mycompany.tecnovitate.Models.Noticias"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Noticias> noticias = (List<Noticias>) request.getAttribute("noticias");
%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="meta.jsp"/>
        <title>TECNOVITATE</title>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <div class="container">
            <div class="row">

                
                <%
                    for (Noticias element : noticias) {
                %>
                <div class="card mb-3 col-12 news-card">
                    <a href="NoticiaMostrarController?id=<%= element.getId()%>">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <img src="<%= element.getPath1()%>" class="card-img">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title"><%= element.getTitulo()%></h5>
                                    <p class="card-text"><%= element.getDescrip()%></p>
                                    <p class="card-text"><small class="text-muted"><%= element.getCategoria().getCategoria()%> </small><small class="text-muted"><%= element.getFecha()%></small></p>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%
                    }
                %>

                
            </div>
        </div>
    </body>
</html>
