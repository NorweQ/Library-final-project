<%@ include file="appAdminHeader.jsp" %>

<div class="m-4 p-3 width-medium">
    <div class="dashboard-content border-dashed p-3 m-4 view-height">
        <div class="col noPadding">
            <div class="row">
                <div class="col-12">
                    <h3 class="color-header text-uppercase"> Book List:</h3>
                </div>
                <div>
                    <label for="searchInput">Search:</label>
                    <input type="text" id="searchInput" onkeyup="filterBooks()"
                           placeholder="Search by title">
                    <label for="categoryFilter">Category:</label>
                    <select id="categoryFilter" onchange="filterByCategory()">
                        <option value="">Select Categories</option>
                        <option value="0">All Categories</option>
                        <c:forEach items="${categories}" var="category">
                            <option value="${category.id}">${category.categoryName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-12">
                </div>
                <div class="col noPadding">
                    <table id="booksTable" style="width:100%">
                        <tr>
                            <th>Book Title</th>
                            <th>Author</th>
                            <th>Category</th>
                            <th>Description</th>
                        </tr>

                        <c:forEach items="${books}" var="book">
                            <form action="/app/borrow/reserved" method="post" class="padding-small text-center">
                                <tr>
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
                                    <td>
                                        <input type="hidden" name="bookId" value="${book.id}">
                                    </td>
                                    <td class="col-2 d-flex align-items-center justify-content-center flex-wrap">
                                        <a href="/app/admin/book/edit/${book.id}"
                                           class="btn btn-warning rounded-0 text-light m-1">Edit</a>
                                        <a href="#" class="btn btn-danger rounded-0 text-light m-1"
                                           onclick="confirmDelete(${book.id})">Delete</a>
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
    function confirmDelete(bookId) {
        const potwierdzenie = window.confirm("Czy na pewno chcesz usunąć ten plan?");
        if (potwierdzenie) {
            deleteBook('ok', bookId);
        } else {
            window.location.href = '/app/admin/book/list';
        }
    }

    function deleteBook(value, bookId) {
        window.location.href = '/app/admin/delete/' + value + '/' + bookId;
    }

    function filterBooks() {
        let input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("booksTable");
        tr = table.getElementsByTagName("tr");

        for (i = 1; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

    function filterByCategory() {
        let value = document.getElementById("categoryFilter").value;
        if (value === "" || value === "0") {
            window.location.href = '/app/admin/book/list';
        }else {
            window.location.href = '/app/admin/book/list/category/' + value;
        }
    }
</script>