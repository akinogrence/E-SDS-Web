<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>

<c:if test="${not empty customerList}">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Id</th>
                <th>Müşteri</th>
                <th>Telefon</th>
                <th>Konum</th>
                <th>Adress</th>
                <th>İşlem</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${customerList}">
                <tr>
                    <td style="vertical-align: middle;">${item.getId()}</td>
                    <td style="vertical-align: middle;">${item.getName()}</td>
                    <td style="vertical-align: middle;">${item.getPhoneNumber()}</td>
                    <td style="vertical-align: middle;">${item.getLocation()}</td>
                    <td style="vertical-align: middle;">${item.getAddress()}</td>
                    <td class="btn-group" style="vertical-align:">
                        <a class="btn btn-warning btn-sm text-white" id="${item.getId()}" data-toggle="modal" data-target="#modalUpdateCustomer"  style="cursor: pointer;"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                        <a class="btn btn-danger btn-sm text-white" id="${item.getId()}" data-toggle="modal" data-target="#modalDeleteCustomer" style="cursor: pointer;"><i class="fa fa-trash" aria-hidden="true"></i></button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

<!-- Add Customer Modal -->
<div class="modal fade" id="modalAddCustomer">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form class="form-group" action="<s:url value="/addCustomer"></s:url>" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Kayıt Ekle</h4>
                        <button type="button" class="close" style="cursor: pointer;" data-dismiss="modal">&times;</button>
                    </div>

                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6" style="border-right: 1px solid #e9ecef;">
                                <label for="name">İsim Soyisim:</label>
                                <input type="text" class="form-control" id="name" name="name" required/>

                                <label for="phoneNumber" style="margin-top: 15px;">Telefon:</label>
                                <input type="text" class="form-control" id="tel" name="phoneNumber" required/> 

                                <label for="location" style="margin-top: 15px;">Konum:</label>
                                <input type="text" class="form-control" id="mail" name="location" required/>
                            </div>
                            <div class="col-md-6">
                                <label for="address">Adres:</label>
                                <textarea class="form-control" id="adress" style="resize: none; height: 210px;" name="address" required></textarea>
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
    <!-- Add Customer Modal -->

    <!-- Update Customer Modal -->
    <div class="modal fade" id="modalUpdateCustomer">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form class="form-group" action="<s:url value="/updateCustomer"></s:url>" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Kayıt Güncelle</h4>
                        <button type="button" class="close" style="cursor: pointer;" data-dismiss="modal">&times;</button>
                    </div>

                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6" style="border-right: 1px solid #e9ecef;">
                                <input type="hidden" name="id" id="hiddncustmrid"/>

                                <label for="name">İsim Soyisim:</label>
                                <input type="text" class="form-control" id="name" name="name" required/>

                                <label for="phoneNumber" style="margin-top: 15px;">Telefon:</label>
                                <input type="text" class="form-control" id="tel" name="phoneNumber" required/> 

                                <label for="location" style="margin-top: 15px;">Konum:</label>
                                <input type="text" class="form-control" id="mail" name="location" required/>
                            </div>
                            <div class="col-md-6">
                                <label for="address">Adres:</label>
                                <textarea class="form-control" id="adress" style="resize: none; height: 210px;" name="address" required></textarea>
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
    <!-- Update Customer Modal -->

    <!-- Delete Customer Modal -->
    <div class="modal fade" id="modalDeleteCustomer">
        <div class="modal-dialog">
            <div class="modal-content">
                <form class="form-group" action="<s:url value="/deleteCustomer"></s:url>" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Kayıt Sil</h4>
                    <button type="button" class="close" style="cursor: pointer;" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">
                    <input type="hidden" name="id" id="hiddncustmrid"/>
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
<!-- Delete Customer Modal -->

<script>
    $(document).ready(function () {
        $("a").click(function () {
            $('input[id="hiddncustmrid"]').val(this.id);
        });
    });
</script>
