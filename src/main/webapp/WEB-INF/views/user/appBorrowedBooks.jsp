<%--
  Created by IntelliJ IDEA.
  User: norweq
  Date: 12.12.2023
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="appHeader.jsp" %>
<div class="m-4 p-3 width-medium">
    <div class="dashboard-content border-dashed p-3 m-4 view-height">
        <div class="col noPadding">
            <div class="row">
                <div class="col-12">
                    <h3 class="color-header text-uppercase"> Reserved Books List:</h3>
                </div>
            </div>
            <form action="/app/book/reserve" method="post" >
                <table style="width:100%">
                    <tr>
                        <th>Book Title</th>
                        <th>Author</th>
                        <th>Category</th>
                        <th>Description</th>
                        <th>Reserved Date</th>
                        <th>Pick Up Date</th>
                    </tr>
                    <tbody class="text-color-lighter">

                    <c:forEach items="${notReceived}" var="borrow">
                        <tr>
                            <c:forEach items="${borrow.book}" var="book">
                                <td>${book.title}</td>
                                <td>
                                    <c:forEach items="${book.author}" var="author">
                                        ${author.fullName}
                                    </c:forEach>
                                </td>
                                <td>
                                    <c:forEach items="${book.category}" var="category">
                                        ${category.categoryName}
                                    </c:forEach>
                                </td>
                                <td>${book.description}</td>
                            </c:forEach>
                            <td>${borrow.borrowDate}</td>
                            <td>${borrow.pickUpDate}</td>
                            <td class="col-2 d-flex align-items-center justify-content-center flex-wrap">
                                <a href="#" class="btn btn-danger rounded-0 text-light m-1"
                                   onclick="potwierdzUsuniecie(${borrow.id})">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <script>
                        function potwierdzUsuniecie(borrowId) {
                            const potwierdzenie = window.confirm("Czy na pewno chcesz usunąć ten plan?");
                            if (potwierdzenie) {
                                usunPrzepis('ok', borrowId);
                            } else {
                                usunPrzepis('cancel', borrowId);
                            }
                        }

                        // Funkcja przekierowująca do servletu z określoną wartością
                        function usunPrzepis(value, borrowId) {
                            window.location.href = '/app/borrow/delete/' + value + '/' + borrowId;
                        }
                    </script>
                    </tbody>
                </table>
            </form>
            <div class="row">
                <div class="col-12">
                    <h3 class="color-header text-uppercase"> Borrowed Books:</h3>
                </div>
            </div>
                <table style="width:100%">
                    <tr>
                        <th>Book Title</th>
                        <th>Author</th>
                        <th>Category</th>
                        <th>Description</th>
                        <th>Return Date</th>
                    </tr>
                    <tbody class="text-color-lighter">

                    <c:forEach items="${received}" var="borrow">
                        <tr>
                            <c:forEach items="${borrow.book}" var="book">
                                <td>${book.title}</td>
                                <td>
                                    <c:forEach items="${book.author}" var="author">
                                        ${author.fullName}
                                    </c:forEach>
                                </td>
                                <td>
                                    <c:forEach items="${book.category}" var="category">
                                        ${category.categoryName}
                                    </c:forEach>
                                </td>
                                <td>${book.description}</td>
                            </c:forEach>
                            <td>${borrow.returnDate}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>
</div>
</section>


<%@ include file="appFooter.jsp" %>
