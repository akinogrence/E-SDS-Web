<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<nav class="navbar navbar-expand-md bg-dark navbar-dark" style="border-bottom: 1px solid #d8d9da">
    <a class="navbar-brand" href="<s:url value="/"></s:url>">E-SDS</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav ml-auto">

                <li class="nav-item"><a style="margin-right: 15px;" class="nav-link" href="<s:url value="/personnels"></s:url>">Personeller</a></li>
            <li class="nav-item"><a style="margin-right: 15px;" class="nav-link" href="<s:url value="/customers"></s:url>">Müşteriler</a></li>
            <li class="nav-item"><a style="margin-right: 15px;" class="nav-link" href="<s:url value="/products"></s:url>">Ürünler</a></li>  
            <li class="nav-item"><a style="margin-right: 15px;" class="nav-link" href="<s:url value="/visits"></s:url>">Ziyaretler</a></li>  
            <li class="nav-item"><a style="margin-right: 15px;" class="nav-link" href="<s:url value="/orders"></s:url>">Siparişler</a></li>   
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    <i class="fa fa-user-circle" aria-hidden="true"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" data-toggle="modal" style="cursor: pointer;" data-target="#modalPassword"><i class="fa fa-lock" aria-hidden="true"></i> Parola Değiştir</a>
                    <a class="dropdown-item" href="doLogout"><i class="fa fa-sign-out" aria-hidden="true"></i> Çıkış Yap</a>
                </div>
            </li>
        </ul>
    </div>  
</nav>

<div class="modal fade" id="modalPassword">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <form class="form-group" action="changePassword" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Parola Değiştir</h4>
                    <button type="button" class="close" style="cursor: pointer;" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">
                    <label name="password">Yeni Parolanız:</label>
                    <input style="margin-top: 15px;" class="form-control" type="password" name="password"/>
                </div>

                <div class="modal-footer">
                    <div class="btn-group">
                        <button type="button" class="btn btn-danger" style="width: 80px; cursor: pointer;" data-dismiss="modal">İptal</button>
                        <button type="submit" class="btn btn-primary" style="width: 80px; cursor: pointer;">Gönder</button>

                    </div>
                </div>
            </form>
        </div>
    </div> 
</div>