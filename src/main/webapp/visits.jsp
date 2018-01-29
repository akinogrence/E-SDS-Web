<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>

<c:if test="${not empty visitList}">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Id</th>
                <th>Personel</th>
                <th>Müşteri</th>
                <th>Oluşturma Tarihi</th>
                <th>Ziyaret Tarihi</th>
                <th>Ziyaret Edildi mi?</th>
                <th>İşlem</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${visitList}">
                <tr>
                    <td style="vertical-align: middle;">${item.getId()}</td>
                    <td style="vertical-align: middle;">${item.getPersonnel().getName()}</td>
                    <td style="vertical-align: middle;">${item.getCustomer().getName()}</td>
                    <td style="vertical-align: middle;">${item.getCreateDate()}</td>
                    <td style="vertical-align: middle;">${item.getVisitDate()}</td>
                    <td style="vertical-align: middle;">${item.getCheckLocation()}</td>
                    <td class="btn-group" style="vertical-align: middle;">
                        <a class="btn btn-warning btn-sm text-white" id="${item.getId()}" data-toggle="modal" data-target="#modalUpdateVisit" style="cursor: pointer;"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                        <a class="btn btn-danger btn-sm text-white" id="${item.getId()}" data-toggle="modal" data-target="#modalDeleteVisit" style="cursor: pointer;"><i class="fa fa-trash" aria-hidden="true"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

<!-- Add Visit Modal -->
<div class="modal fade" id="modalAddVisit">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="form-group" action="<s:url value="/addVisit"></s:url>" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Kayıt Ekle</h4>
                        <button type="button" class="close" style="cursor: pointer;" data-dismiss="modal">&times;</button>
                    </div>

                    <div class="modal-body">
                        <label for="personnel.id">Personel:</label>
                        <select class="form-control" name="personnel.id">
                        <c:if test="${not empty personnelListForVisit}">
                            <c:forEach var="item" items="${personnelListForVisit}">
                                <option value="${item.getId()}">${item.getName()}</option>
                            </c:forEach>
                        </c:if>
                    </select>

                    <label for="customer.id" style="margin-top: 15px;">Müşteri:</label>
                    <select class="form-control" name="customer.id">
                        <c:if test="${not empty customerListForVisit}">
                            <c:forEach var="item" items="${customerListForVisit}">
                                <option value="${item.getId()}">${item.getName()}</option>
                            </c:forEach>
                        </c:if>
                    </select>

                    <label for="visitDate" style="margin-top: 15px;">Ziyaret Tarihi: </label>
                    <br/>
                    <input style="width: 100%;" type="date" name="visitDate" required/>

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
<!-- Add Visit Modal -->

<!-- Update Visit Modal -->
<div class="modal fade" id="modalUpdateVisit">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="form-group" action="<s:url value="/updateVisit"></s:url>" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Kayıt Güncelle</h4>
                        <button type="button" class="close" style="cursor: pointer;" data-dismiss="modal">&times;</button>
                    </div>

                    <div class="modal-body">
                        <input type="hidden" name="id" id="hiddnvstid"/>

                        <label for="personnel.id">Personel:</label>
                        <select class="form-control" name="personnel.id">
                        <c:if test="${not empty personnelListForVisit}">
                            <c:forEach var="item" items="${personnelListForVisit}">
                                <option value="${item.getId()}">${item.getName()}</option>
                            </c:forEach>
                        </c:if>
                    </select>

                    <label for="customer.id" style="margin-top: 15px;">Müşteri:</label>
                    <select class="form-control" name="customer.id">
                        <c:if test="${not empty customerListForVisit}">
                            <c:forEach var="item" items="${customerListForVisit}">
                                <option value="${item.getId()}">${item.getName()}</option>
                            </c:forEach>
                        </c:if>
                    </select>

                    <label for="visitDate" style="margin-top: 15px;">Ziyaret Tarihi: </label>
                    <br/>
                    <input style="width: 100%;" type="date" name="visitDate" required/>

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
<!-- Update Visit Modal -->

<!-- Delete Visit Modal -->
<div class="modal fade" id="modalDeleteVisit">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="form-group" action="<s:url value="/deleteVisit"></s:url>" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Kayıt Sil</h4>
                    <button type="button" class="close" style="cursor: pointer;" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">
                    <input type="hidden" name="id" id="hiddnvstid"/>
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
<!-- Delete Visit Modal -->

<script>
    $(document).ready(function () {
        $("a").click(function () {
            $('input[id="hiddnvstid"]').val(this.id);
        });
    });
</script>