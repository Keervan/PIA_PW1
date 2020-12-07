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
                            <img src="<%= sesion.getPath()%>" class="rounded mx-auto d-block" alt="...">
                        </div>
                    </div>
                </div>
                <h2 class="col-12 text-center">Nombre Usuario: <%= sesion.getNombre_Usua()%></h2>
                <h2 class="col-12 text-center">Correo: <%= sesion.getEmail()%></h2>
                <h2 class="col-12 text-center">Redes Sociales: <% if (sesion.getRedes() != null) {%><%= sesion.getRedes()%><% } %></h2>
                <h2 class="col-12 text-center">Descripción: <% if (sesion.getDescripcion() != null) {%><%= sesion.getDescripcion()%><% }%></h2>
                
                    <div class="container justify-content-center">
                        <div class="form-group">
                         <form action="editUsuaController">
                        <input type="submit" class="btn btn-primary col-3" value="Editar Información">
                        </form>
                        <form action="FavoritosController" >
                           <input type="submit" class="btn btn-info col-3" value="Favoritos ">
                            <input type="hidden" name="idUser" value="<%= sesion.getIdUsua()%>">
                        </form>
                         <form action="CerrarSesion" method="POST" >
                           <input type="submit" class="btn btn-danger col-3" value="Cerrar Sesión">
                        </form>
                         </div>
                    </div>
                
            </div>
        </div>
    </body>
</html>
