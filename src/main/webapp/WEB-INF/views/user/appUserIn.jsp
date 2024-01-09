<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 22.11.2023
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="appHeader.jsp" %>
<div class="m-4 p-3 width-medium">
    <div class="dashboard-content border-dashed p-3 m-4 view-height">
            <div class="col noPadding">
                <h3 class="color-header text-uppercase"> Hello
                    <c:forEach items="${users}" var="user">
                        ${user.firstName}
                        ${user.lastName}
                    </c:forEach></h3>
            </div>
        <p>This is space for tell somethink about your library</p>
        <img src="https://miro.medium.com/v2/resize:fit:1180/0*BVlH61W52QhuwAxo.jpg" alt="Opis zdjęcia" width="700" height="500">
        </div>
    </div>
</div>
</section>


<%@ include file="appFooter.jsp" %>