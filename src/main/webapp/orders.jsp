<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>

<c:if test="${not empty orderList}">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Id</th>
                <th>Personel</th>
                <th>Müşteri</th>
                <th>Sipariş Tarihi</th>
                <th>Toplam Ücret</th>
                <th>İşlem</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${orderList}">
                <tr>
                    <td style="vertical-align: middle;">${item.getId()}</td>
                    <td style="vertical-align: middle;">${item.getVisit().getPersonnel().getName()}</td>
                    <td style="vertical-align: middle;">${item.getVisit().getCustomer().getName()}</td>
                    <td style="vertical-align: middle;">${item.getOrderDate()}</td>
                    <td style="vertical-align: middle;">${item.getTotalPrice()}</td>
                    <td class="btn-group" style="vertical-align: middle;">
                        <a class="btn btn-primary btn-sm text-white ajx" id="${item.getId()}" data-toggle="modal" data-target="#modalOrderDetail"  style="cursor: pointer;"><i class="fa fa-eye" aria-hidden="true"></i></a>
                        <a class="btn btn-danger btn-sm text-white" id="${item.getId()}" data-toggle="modal" data-target="#modalDeleteOrder" style="cursor: pointer;"><i class="fa fa-trash" aria-hidden="true"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

<!-- Order Detail Modal with AJAX -->
<div class="modal fade" id="modalOrderDetail">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="form-group">
                <div class="modal-header">
                    <h4 class="modal-title">Sipariş Detayları</h4>
                    <button type="button" class="close" style="cursor: pointer;" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">
                    <div id="ordrDet" class="row">


                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" style="width: 80px; cursor: pointer;" data-dismiss="modal">Tamam</button>
                </div>
            </div>
        </div>
    </div> 
</div>
<!-- Order Detail Modal with AJAX -->

<!-- Delete Order Modal -->
<div class="modal fade" id="modalDeleteOrder">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="form-group" action="<s:url value="/deleteOrder"></s:url>" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Kayıt Sil</h4>
                    <button type="button" class="close" style="cursor: pointer;" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">
                    <input type="hidden" name="id" id="hiddnordid"/>
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
<!-- Delete Order Modal -->

<script>
    $(document).ready(function () {
        $(".ajx").click(function () {
            $.post("orderDetail", {id: this.id}, function (data, status) {
                if (status) {
                    var jsonArr = JSON.parse(data);
                    var htmlJsCode = '';
                    for (var i = 0; i < jsonArr.length; i++) {
                        htmlJsCode +=
                                '                           <div style="margin-bottom: 25px;" class="col-md-3">\n' +
                                '                                <p style="margin: 0; font-size: 14px;">Ürün</p>\n' +
                                '                                <p style="margin: 0; font-size: 14px;">Fiyat</p>\n' +
                                '                                <p style="margin: 0; font-size: 14px;">Adet</p>\n' +
                                '                            </div>\n' +
                                '                            <div style="border-right: 1px solid rgba(0,0,0,.2);margin-bottom: 25px;" class="col-md-9">\n' +
                                '                                <p style="margin: 0; font-size: 14px;color: cadetblue;"> ' + jsonArr[i].product.name + '</p>\n' +
                                '                                <p style="margin: 0; font-size: 14px;color: cadetblue;"> ' + jsonArr[i].product.price + ' TL</p>\n' +
                                '                                <p style="margin: 0; font-size: 14px;color: cadetblue;"> ' + jsonArr[i].productCount + '</p>\n' +
                                '                            </div>\n';
                    }
                    $("#ordrDet").html(htmlJsCode);
                }
            });
        });

        $("a").click(function () {
            $('input[id="hiddnordid"]').val(this.id);
        });
    });
</script>