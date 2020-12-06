<%-- 
    Document   : Si
    Created on : 29/11/2020, 03:34:50 AM
    Author     : dykeo
--%>

<%@page import="com.mycompany.tecnovitate.Models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario sesion = (Usuario) session.getAttribute("logIn");
%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="meta.jsp"/>
        <title>Perfil</title>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <div class="container">
            <div class="row">
                
                <h1 class="col-12">Bienvenido</h1>
                <div id="carouselExampleControls" class="carousel slide col-12" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="<%= sesion.getPath()%>" class="d-block w-100" alt="...">
                        </div>
                    </div>
                </div>
                <h2 class="col-12">Nombre Usuario: <%= sesion.getNombre_Usua()%></h2>
                <h2 class="col-12">Correo: <%= sesion.getEmail()%></h2>
                <h2 class="col-12">Redes Sociales: <% if (sesion.getRedes() != null) {%><%= sesion.getRedes()%><% } %></h2>
                <h2 class="col-12">Descripción: <% if (sesion.getDescripcion() != null) {%><%= sesion.getDescripcion()%><% }%></h2>
                <form action="editUsuaController">
                    <input type="submit" class="btn btn-primary" value="Editar Información">
                </form>
                <form action="FavoritosController">
                    <input type="submit" class="btn btn-primary" value="Favoritos">
                    <input type="hidden" name="idUser" value="<%= sesion.getIdUsua()%>">
                </form>
                <form action="CerrarSesion" method="POST">
                    <input type="submit" class="btn btn-primary" value="Cerrar Sesión">
                </form>
                
            </div>
        </div>
    </body>
</html>
