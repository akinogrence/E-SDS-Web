<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>

<c:if test="${not empty personnelList}">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Id</th>
                <th>Personel</th>
                <th>Kullanıcı Adı</th>
                <th>E-Mail</th>
                <th>Telefon</th>
                <th>Parola</th>
                <th>İşlem</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${personnelList}">
                <tr>
                    <td style="vertical-align: middle;">${item.getId()}</td>
                    <td style="vertical-align: middle;">${item.getName()}</td>
                    <td style="vertical-align: middle;">${item.getUserName()}</td>
                    <td style="vertical-align: middle;">${item.getEmail()}</td>
                    <td style="vertical-align: middle;">${item.getPhoneNumber()}</td>
                    <td style="vertical-align: middle;">${item.getPassword()}</td>
                    <td class="btn-group" style="vertical-align: middle;">
                        <a class="btn btn-warning btn-sm text-white" id="${item.getId()}" data-toggle="modal" data-target="#modalUpdatePersonnel" style="cursor: pointer;"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                        <a class="btn btn-danger btn-sm text-white" id="${item.getId()}" data-toggle="modal" data-target="#modalDeletePersonnel" style="cursor: pointer;"><i class="fa fa-trash" aria-hidden="true"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

<!-- Add Personnel Modal -->
<div class="modal fade" id="modalAddPersonnel">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form class="form-group" action="<s:url value="/addPersonnel"></s:url>" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Kayıt Ekle</h4>
                        <button type="button" class="close" style="cursor: pointer;" data-dismiss="modal">&times;</button>
                    </div>

                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6" style="border-right: 1px solid #e9ecef;">
                                <label for="name">İsim Soyisim:</label>
                                <input type="text" class="form-control" id="name" name="name" required/>

                                <label for="userName" style="margin-top: 15px;">Kullanıcı Adı:</label>
                                <input type="text" class="form-control" id="userName" name="userName" required/>

                                <label for="email" style="margin-top: 15px;">E-Mail:</label>
                                <input type="email" class="form-control" id="mail" name="email" required/>
                            </div>
                            <div class="col-md-6">
                                <label for="phoneNumber">Telefon:</label>
                                <input type="text" class="form-control" id="tel" name="phoneNumber" required/>

                                <label for="password" style="margin-top: 15px;">Parola:</label>
                                <input type="password" class="form-control" id="password" name="password" required/>
                            </div>
                        </div>
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
    <!-- Add Personnel Modal -->

    <!-- Update Personnel Modal -->
    <div class="modal fade" id="modalUpdatePersonnel">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form class="form-group" action="<s:url value="/updatePersonnel"></s:url>" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Kayıt Güncelle</h4>
                        <button type="button" class="close" style="cursor: pointer;" data-dismiss="modal">&times;</button>
                    </div>

                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6" style="border-right: 1px solid #e9ecef;">
                                <input type="hidden" name="id" id="hiddnpersnlid"/>

                                <label for="name">İsim Soyisim:</label>
                                <input type="text" class="form-control" id="name" name="name" required/>

                                <label for="userName" style="margin-top: 15px;">Kullanıcı Adı:</label>
                                <input type="text" class="form-control" id="userName" name="userName" required/>

                                <label for="email" style="margin-top: 15px;">E-Mail:</label>
                                <input type="email" class="form-control" id="mail" name="email" required/>
                            </div>
                            <div class="col-md-6">
                                <label for="phoneNumber">Telefon:</label>
                                <input type="text" class="form-control" id="tel" name="phoneNumber" required/>

                                <label for="password" style="margin-top: 15px;">Parola:</label>
                                <input type="password" class="form-control" id="password" name="password" required/>
                            </div>
                        </div>
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
    <!-- Update Personnel Modal -->

    <!-- Delete Personnel Modal -->
    <div class="modal fade" id="modalDeletePersonnel">
        <div class="modal-dialog">
            <div class="modal-content">
                <form class="form-group" action="<s:url value="/deletePersonnel"></s:url>" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Kayıt Sil</h4>
                    <button type="button" class="close" style="cursor: pointer;" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">
                    <input type="hidden" name="id" id="hiddnpersnlid"/>
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
<!-- Delete Personnel Modal -->

<script>
    $(document).ready(function () {
        $("a").click(function () {
            $('input[id="hiddnpersnlid"]').val(this.id);
        });
    });
</script>

