<%-- 
    Document   : index
    Created on : 28/11/2020, 08:43:02 PM
    Author     : dykeo
--%>

<%@page import="com.mycompany.tecnovitate.Models.Usuario"%>
<%@page import="com.mycompany.tecnovitate.Models.Noticias"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Noticias> noticias = (List<Noticias>) request.getAttribute("noticias");
    Usuario sesion = (Usuario) session.getAttribute("logIn");
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


                <div class="card mb-3 col-12 news-card">
                    <%
                        for (Noticias element : noticias) {
                    %>
                    <a href="NoticiaMostrarController?id=<%= element.getId()%>&idUser=<%if (sesion != null) {%><%=sesion.getIdUsua()%><%}%>">
                        <div class="row no-gutters">

                            <div class="card col-md-4" style="width: 18rem; ">
                                <img src="<%= element.getPath1()%>" class="card-img-top" alt="<%= element.getPath1()%>">
                                <div class="card-body">
                                    <h5 class="card-title"><%= element.getTitulo()%></h5>
                                    <p class="card-text"><%= element.getDescrip()%></p>
                                    <a href="#" class="btn btn-primary">Ver noticia</a>
                                </div>
                            </div>

                        </div>
                    </a>

                    <%}%>
                </div>

            </div>
        </div>
    </body>
</html>
