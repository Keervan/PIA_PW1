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
            <div class="row input-group inline">

                <%
                    int i = 0;
                    for (Noticias element : noticias) {
                %>
                <div class="card bg-dark text-white col-12">
                    <img class="card-img" src="<%= element.getPath1()%>" alt="Card image">
                    <div class="card-img-overlay justify-content-md-center align-items-end">
                        <h3 class="card-title"><%= element.getTitulo()%></h3>
                        <h5 class="card-text"><%= element.getDescrip()%></h5>
                        <p class="card-text"><%= element.getFecha()%></p>
                    </div>
                </div>                     

                <%
                        break;
                    }
                %>
                <br/>

                <div class="card-deck col-12 news-card justify-content-md-center">
                    <%
                        for (Noticias element : noticias) {
                    %>
                    <a href="NoticiaMostrarController?id=<%= element.getId()%>&idUser=<%if (sesion != null) {%><%=sesion.getIdUsua()%><%}%>">
                        <div class="row no-gutters col-4">

                            <div class="card" style="width: 18rem; ">
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
                <div id="Tarjetas">
                    <%
                        for (Noticias element : noticias) {
                    %>
                    <div class="card mb-3" style="max-width: 1500px">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <img
                                    src="<%= element.getPath1()%>"
                                    class="card-img"
                                    />
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title"><%= element.getTitulo()%></h5>
                                    <p class="card-text">
                                        <%= element.getDescrip()%>
                                    </p>
                                    <p>
                                        <a href="#" class="btn btn-primary">Ver noticia</a>
                                    </p>
                                    <p class="card-text">
                                        <small class="text-muted"><%= element.getFecha()%></small>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%}%>
                </div>


            </div>
        </div>
    </div>
</body>
</html>
