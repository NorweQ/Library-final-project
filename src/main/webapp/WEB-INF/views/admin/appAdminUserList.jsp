<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="appAdminHeader.jsp" %>

<div class="m-4 p-3 width-medium">
    <div class="dashboard-content border-dashed p-3 m-4 view-height">
        <div class="col noPadding">
            <div class="row">
                <div class="col-12">
                    <h3 class="color-header text-uppercase">User List:</h3>
                </div>
                <div class="col-12">
                </div>
                <div class="col noPadding">
                    <table id="booksTable" style="width:100%">
                        <tr>
                            <th>ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Admin</th>
                        </tr>

                        <c:forEach items="${users}" var="user">
                            <form action="/app/borrow/reserved" method="post" class="padding-small text-center">
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.firstName}</td>
                                    <td>${user.lastName}</td>
                                    <td>${user.email}</td>
                                    <td>${user.isAdmin}</td>
                                    <td class="col-2 d-flex align-items-center justify-content-center flex-wrap">
                                        <a href="#" class="btn btn-danger rounded-0 text-light m-1"
                                           onclick="confirmDelete(${user.id})">Delete</a>
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="appAdminFooter.jsp" %>

<script>
    function confirmDelete(userId) {
        const confirm = window.confirm("Did you want to delete this user?");
        if (confirm) {
            deleteUser('ok', userId);
        } else {
            window.location.href = '/app/admin/user/list';
        }
    }
    function deleteUser(value, userId) {
        window.location.href = '/app/admin/delete/user/' + value + '/' + userId;
    }
</script>