<%@ include file="appHeader.jsp" %>

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
                        <br/>
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
                                <tr data-category="${book.category}">
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
                                    <td>
                                        <button class="btn btn-color rounded-0" style="width:100%" type="submit">Reserve
                                        </button>
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

<%@ include file="appFooter.jsp" %>

<script>
    function filterBooks() {
        let input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("booksTable");
        tr = table.getElementsByTagName("tr");

        for (i = 1; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0]; // Change index based on the column you want to filter
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
    function filterBooksByCategory() {
        let categoryFilter, table, tr, tdCategory, i, category;
        categoryFilter = document.getElementById("categoryFilter");
        table = document.getElementById("booksTable");
        tr = table.getElementsByTagName("tr");

        for (i = 1; i < tr.length; i++) {
            tdCategory = tr[i].getElementsByTagName("td")[2];

            category = tdCategory.textContent || tdCategory.innerText;

            const categoryMatch = (categoryFilter.value === "") || (category === categoryFilter.options[categoryFilter.selectedIndex].text.toLowerCase());

            if (categoryMatch) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
    let categoryFilter, table, tr, tdCategory, i, category;
    categoryFilter = document.getElementById("categoryFilter");
    table = document.getElementById("booksTable");
    tr = table.getElementsByTagName("tr");

    for (i = 1; i < tr.length; i++) {
        tdCategory = tr[i].getElementsByTagName("td")[2];

        category = tdCategory.textContent || tdCategory.innerText;

        var categoryMatch = (categoryFilter.value === "") || (category === categoryFilter.options[categoryFilter.selectedIndex].text.toLowerCase());

        if (categoryMatch) {
            tr[i].style.display = "";
        } else {
            tr[i].style.display = "none";
        }

    }
    function filterByCategory() {
        let value = document.getElementById("categoryFilter").value;
        if (value === "" || value === "0") {
            window.location.href = '/app/book/list';
        }else {
            window.location.href = '/app/user/book/list/category/' + value;
        }
    }
</script>