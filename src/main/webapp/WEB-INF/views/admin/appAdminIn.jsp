<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="appAdminHeader.jsp" %>
<div class="m-4 p-3 width-medium">
    <div class="dashboard-content border-dashed p-3 m-4 view-height">
        <div class="col noPadding">
            <h3 class="color-header text-uppercase"> Hello
                <c:forEach items="${admins}" var="admin">
                    ${admin.firstName}
                    ${admin.lastName}
                </c:forEach></h3>
        </div>
        <p>This is space for tell somethink about your library</p>
    </div>
</div>
</div>
</section>
