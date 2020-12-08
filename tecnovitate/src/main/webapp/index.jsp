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
                <div
                    id="carouselExampleCaptions"
                    class="carousel slide"
                    data-ride="carousel"
                    >
                    <ol class="carousel-indicators">
                        <li
                            data-target="#carouselExampleCaptions"
                            data-slide-to="0"
                            class="active"
                            ></li>
                        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                    </ol>
                    <%
                        for (int i = 0; i < 3; i++) {
                    %>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img
                                src=<%= element.getPath1()%>
                                class="d-block w-100"
                                height="500"
                                alt=<%= element.getPath1()%>
                                />
                            <div class="carousel-caption d-none d-md-block">
                                <h5><%= element.getTitulo()%></h5>
                                <p><%= element.getDescrip()%></p>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <a
                        class="carousel-control-prev"
                        href="#carouselExampleCaptions"
                        role="button"
                        data-slide="prev"
                        >
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a
                        class="carousel-control-next"
                        href="#carouselExampleCaptions"
                        role="button"
                        data-slide="next"
                        >
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <%
                    }
                %>

                <%
                    for (Noticias element : noticias) {
                %>
                <div class="card mb-3 col-12 news-card">
                    <a href="NoticiaMostrarController?id=<%= element.getId()%>">
                        <div class="row no-gutters">
                            <%
                                for (int i = 0; i < 3; i++) {
                            %>
                            <div class="card col-md-4" style="width: 18rem; ">
                                <img src="<%= element.getPath1()%>" class="card-img-top" alt="<%= element.getPath1()%>">
                                <div class="card-body">
                                    <h5 class="card-title"><%= element.getTitulo()%></h5>
                                    <p class="card-text"><%= element.getDescrip()%></p>
                                    <a href="#" class="btn btn-primary">Ver noticia</a>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </a>
                </div>
                <div class="card mb-3 col-12 news-card">
                    <a href="NoticiaMostrarController?id=<%= element.getId()%>">
                        <div class="row no-gutters">
                            <%
                                for (int i = 0; i < 3; i++) {
                            %>
                            <div class="col-md-6">
                                <img src="<%= element.getPath1()%>" class="card-img">
                            </div>
                            <div class="col-md-6">
                                <div class="card-body">
                                    <h5 class="card-title"><%= element.getTitulo()%></h5>
                                    <p class="card-text"><%= element.getDescrip()%></p>
                                    <p class="card-text"><small class="text-muted"><%= element.getCategoria().getCategoria()%> </small><small class="text-muted"><%= element.getFecha()%></small></p>
                                </div>
                            </div>
                            <%
                                }
                            %>
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
