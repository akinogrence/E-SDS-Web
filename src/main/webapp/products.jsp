<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>

        <style>
            .sidebar{
                background-color: #f8f9fa;
                border-right: 1px solid #e8e9ea;
                padding: 0 30px;
            }

            .title{
                font-size: 18px;
                padding: 20px 35px 20px 0;
                color :rgba(0,0,0,.8);
                border-bottom: 1px solid #e8e9ea;
            }

            .list{
                list-style-type: none;
                padding: 0;
                font-size: 14px;margin: 0;
            }

            .item{
                padding: 10px 35px 10px 0;
                border-bottom: 1px solid #e8e9ea;
                cursor: pointer;
                color :rgba(0,0,0,.5);
                display: block;
            }

            .item:hover{
                color :rgba(0,0,0,.8);
            }

            .figure{
                border:2px solid transparent;
                padding-bottom: 10px;
            }

            .figure:hover{
                border:2px solid #e8e9ea;
            }

            .categorybutton{
                visibility: hidden;
                opacity: 0.75
            }

            .categoryitem:hover .categorybutton{
                visibility: visible;
            }

            .productbutton{
                visibility:  hidden;
                opacity: 0.75;
                position:absolute;
            }

            .thumb:hover .productbutton{
                visibility: visible;
            }

        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>

        <div class="container-fluid">
            <div class="row">
                <div style="height: 100%" class="col-md-3 col-sm-4 sidebar">
                    <div class="title">Kategoriler</div>
                    <div class="list">
                        <c:if test="${not empty categoryList}">
                            <c:forEach var="item" items="${categoryList}">
                                <div class="row categoryitem">
                                    <div class="col-md-8">
                                        <a class="item" href="<s:url value="/products/${item.getLinkName()}/${item.getId()}"></s:url>" style="text-decoration: none;">
                                            <i class="fa fa-folder-open" aria-hidden="true"></i> ${item.getName()}
                                        </a>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="btn-group categorybutton">
                                            <a class="btn btn-sm text-secondary" id="${item.getId()}" data-toggle="modal" data-target="#modalUpdateCategory" style="cursor: pointer;"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                            <a class="btn btn-sm text-secondary" id="${item.getId()}" data-toggle="modal" data-target="#modalDeleteCategory" style="cursor: pointer;"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                    <button class="btn btn-info fa fa-plus pull-right" data-toggle="modal" data-target="#modalAddCategory" style="cursor:pointer;margin-top: 25px;"></button>
                </div>

                <div class="col-md-9" style="margin-top: 5px">
                    <div class="row">
                        <c:if test="${not empty productList}">
                            <c:forEach var="item" items="${productList}">
                                <div style="margin-top:25px;" class="col-md-3 thumb">
                                    <div class="btn-group productbutton">
                                        <a class="btn btn-sm text-secondary" id="${item.getId()}" data-toggle="modal" data-target="#modalUpdateProduct" style="cursor: pointer;"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                        <a class="btn btn-sm text-secondary" id="${item.getId()}" data-toggle="modal" data-target="#modalDeleteProduct" style="color:inherit; cursor: pointer;"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                    </div>
                                    <figure class="figure">
                                        <a href="#"><img class="figure-img img-fluid" src="${item.getImgLink()}"/></a>
                                        <figcaption class="figure-caption text-center">
                                            <p style="font-size: 12px;height:50px" >${item.getName()}</p>
                                            <div id="caption" style="margin-top: 25px; ">
                                                <h3 style="font-weight: bold">${item.getPrice()} TL</h3>
                                            </div>
                                        </figcaption>
                                    </figure>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                    <br/>
                    <button class="btn btn-info btn-lg fa fa-plus pull-right" style="margin:25px; cursor: pointer;" data-toggle="modal" data-target="#modalAddProduct" style="cursor:pointer;margin-top: 25px;"></button>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modalAddProduct">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form class="form-group" action="<s:url value="/addProduct"></s:url>" method="post">
                            <div class="modal-header">
                                <h4 class="modal-title">Ürün Ekle</h4>
                                <button type="button" class="close" style="cursor: pointer;" data-dismiss="modal">&times;</button>
                            </div>

                            <div class="modal-body">
                                <label for="category.id">Kategori: </label>
                                <select class="form-control" name="category.id">
                                <c:if test="${not empty categoryList}">
                                    <c:forEach var="item" items="${categoryList}">
                                        <option value="${item.getId()}">${item.getName()}</option>
                                    </c:forEach>
                                </c:if>
                            </select>

                            <label style="margin-top:15px;" for="name">Ürün Adı: </label>
                            <br>
                            <input style="width: 100%;" type="text" name="name" required/>

                            <label style="margin-top:15px;" for="price">Fiyat: </label>
                            <br>
                            <input style="width: 100%;" type="number" step="0.01" name="price" required/>

                            <label style="margin-top:15px;" for="imgLink">Resim Linki: </label>
                            <br>
                            <input style="width: 100%;" type="text" name="imgLink" required/>
                        </div>

                        <div class="modal-footer">
                            <div class="btn-group">
                                <button type="button" class="btn btn-danger" style="width: 100px; cursor: pointer;" data-dismiss="modal">İptal</button>
                                <button type="submit" class="btn btn-primary" style="width: 100px; cursor: pointer;">Ekle</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div> 
        </div>

        <div class="modal fade" id="modalUpdateProduct">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form class="form-group" action="<s:url value="/updateProduct"></s:url>" method="post">
                            <div class="modal-header">
                                <h4 class="modal-title">Ürün Ekle</h4>
                                <button type="button" class="close" style="cursor: pointer;" data-dismiss="modal">&times;</button>
                            </div>

                            <div class="modal-body">
                                <input id="hiddnproid" type="hidden" name="id" />

                                <label for="category.id">Kategori: </label>
                                <select class="form-control" name="category.id">
                                <c:if test="${not empty categoryList}">
                                    <c:forEach var="item" items="${categoryList}">
                                        <option value="${item.getId()}">${item.getName()}</option>
                                    </c:forEach>
                                </c:if>
                            </select>

                            <label style="margin-top:15px;" for="name">Ürün Adı: </label>
                            <br>
                            <input style="width: 100%;" type="text" name="name" required/>

                            <label style="margin-top:15px;" for="price">Fiyat: </label>
                            <br>
                            <input style="width: 100%;" type="number" step="0.01" name="price" required/>

                            <label style="margin-top:15px;" for="imgLink">Resim Linki: </label>
                            <br>
                            <input style="width: 100%;" type="text" name="imgLink" required/>

                        </div>

                        <div class="modal-footer">
                            <div class="btn-group">
                                <button type="button" class="btn btn-danger" style="width: 100px; cursor: pointer;" data-dismiss="modal">İptal</button>
                                <button type="submit" class="btn btn-primary" style="width: 100px; cursor: pointer;">Güncelle</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div> 
        </div>

        <div class="modal fade" id="modalDeleteProduct">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form class="form-group" action="<s:url value="/deleteProduct"></s:url>" method="post">
                            <div class="modal-header">
                                <h4 class="modal-title">Kayıt Sil</h4>
                                <button type="button" class="close" style="cursor: pointer;" data-dismiss="modal">&times;</button>
                            </div>

                            <div class="modal-body">
                                <input type="hidden" name="id" id="hiddnproid"/>
                                Kayıt Silinsin mi?
                            </div>

                            <div class="modal-footer">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary" style="width: 100px; cursor: pointer;" data-dismiss="modal">Hayır</button>
                                    <button type="submit" class="btn btn-danger" style="width: 100px; cursor: pointer;">Evet</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div> 
            </div>


            <div class="modal fade" id="modalAddCategory">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form class="form-group" action="<s:url value="/addCategory"></s:url>" method="post">
                            <div class="modal-header">
                                <h4 class="modal-title">Kategori Ekle</h4>
                                <button type="button" class="close" style="cursor: pointer;" data-dismiss="modal">&times;</button>
                            </div>

                            <div class="modal-body">
                                <label for="name" >Kategori Adı: </label>
                                <br/>
                                <input style="width: 100%;" type="text" name="name" required/>

                                <label style="margin-top: 15px;" for="linkName" >Kategori Link Adı: </label>
                                <br/>
                                <input style="width: 100%;" type="text" name="linkName" required/>
                            </div>

                            <div class="modal-footer">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-danger" style="width: 100px; cursor: pointer;" data-dismiss="modal">İptal</button>
                                    <button type="submit" class="btn btn-primary" style="width: 100px; cursor: pointer;">Ekle</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div> 
            </div>

            <div class="modal fade" id="modalUpdateCategory">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form class="form-group" action="<s:url value="/updateCategory"></s:url>" method="post">
                            <div class="modal-header">
                                <h4 class="modal-title">Kategori Bilgisi Güncelle</h4>
                                <button type="button" class="close" style="cursor: pointer;" data-dismiss="modal">&times;</button>
                            </div>

                            <div class="modal-body">
                                <input type="hidden" id="hiddncatid" name="id"/>

                                <label for="name" >Kategory Adı: </label>
                                <br/>
                                <input style="width: 100%;" type="text" name="name" required/>

                                <label style="margin-top: 15px;" for="linkName" >Kategori Link Adı: </label>
                                <br/>
                                <input style="width: 100%;" type="text" name="linkName" required/>
                            </div>

                            <div class="modal-footer">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-danger" style="width: 100px; cursor: pointer;" data-dismiss="modal">İptal</button>
                                    <button type="submit" class="btn btn-primary" style="width: 100px; cursor: pointer;">Güncelle</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div> 
            </div>

            <div class="modal fade" id="modalDeleteCategory">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form class="form-group" action="<s:url value="/deleteCategory"></s:url>" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Kayıt Sil</h4>
                            <button type="button" class="close" style="cursor: pointer;" data-dismiss="modal">&times;</button>
                        </div>

                        <div class="modal-body">
                            <input type="hidden" name="id" id="hiddncatid"/>
                            Kayıt Silinsin mi?
                        </div>

                        <div class="modal-footer">
                            <div class="btn-group">
                                <button type="button" class="btn btn-primary" style="width: 100px; cursor: pointer;" data-dismiss="modal">Hayır</button>
                                <button type="submit" class="btn btn-danger" style="width: 100px; cursor: pointer;">Evet</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div> 
        </div>

        <script>
            $(document).ready(function () {
                $("a").click(function () {
                    $('input[id="hiddncatid"]').val(this.id);
                });

                $("a").click(function () {
                    $('input[id="hiddnproid"]').val(this.id);
                });
            });
        </script>
    </body>
</html>
