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

<div class="m-4 p-4 width-medium">
    <div class="dashboard-header m-4">
        <div class="dashboard-menu">
            <div class="menu-item border-dashed">
                <a href="/app/recipe/add">
                    <i class="far fa-plus-square icon-plus-square"></i>
                    <span class="title">dodaj przepis</span>
                </a>
            </div>
            <div class="menu-item border-dashed">
                <a href="/app/plan/add">
                    <i class="far fa-plus-square icon-plus-square"></i>
                    <span class="title">dodaj plan</span>
                </a>
            </div>
            <div class="menu-item border-dashed">
                <a href="/app/recipe/plan/add">
                    <i class="far fa-plus-square icon-plus-square"></i>
                    <span class="title">dodaj przepis do planu</span>
                </a>
            </div>
        </div>
        <div class="dashboard-alerts">
            <div class="alert-item alert-info">
                <i class="fas icon-circle fa-info-circle"></i>
                <span class="font-weight-bold">Liczba przepisów: ${recipesNumber}</span>
            </div>
            <div class="alert-item alert-light">
                <i class="far icon-calendar fa-calendar-alt"></i>
                <span class="font-weight-bold">Liczba planów: ${plansNumber}</span>
            </div>
            <br>
        </div>
    </div>

    <div class="m-4 p-4 border-dashed">
        <h2 class="dashboard-content-title">
            <span>Ostatnio dodany plan:</span> ${lastPlan[0][5]}
        </h2>

        <c:set var="previousDay" value=""/>

        <c:forEach items="${lastPlan}" var="plan" varStatus="status">
            <c:if test="${previousDay ne plan[0]}">
                <c:set var="previousDay" value="${plan[0]}"/>

                <table class="table">
                <thead>
                <tr class="d-flex">
                    <th class="col-2">${plan[0]}</th>
                    <th class="col-8"></th>
                    <th class="col-2"></th>
                </tr>
                </thead>
                <tbody>
            </c:if>

            <tr class="d-flex">
                <td class="col-2">${plan[1]}</td>
                <td class="col-8">${plan[2]}</td>
                <td class="col-2">
                        <%-- tu wstawimy link z parametrem id (${plan[4]}) do app/recipe/details--%>
                    <button type="button" class="btn btn-primary rounded-0">Szczegóły (id: ${plan[4]})</button>
                </td>
            </tr>

            <c:if test="${status.last}">
                </tbody>
                </table>
            </c:if>

        </c:forEach>
    </div>
</div>
</div>
</section>


<%@ include file="appFooter.jsp" %>