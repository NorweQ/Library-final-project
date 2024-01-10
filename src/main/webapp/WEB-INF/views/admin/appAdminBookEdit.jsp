<%@ include file="appAdminHeader.jsp" %>

<div class="m-4 p-3 width-medium">
    <div class="dashboard-content border-dashed p-3 m-4 view-height">
        <form id="bookForm1" action="/app/admin/edit/book" method="post">
            <input type="hidden" name="id" value="${book.id}">
            <div class="row border-bottom border-3 p-1 m-1">
                <div class="col noPadding">
                    <h3 class="color-header text-uppercase">Edit Book</h3>
                </div>
                <div class="col d-flex justify-content-end mb-2">
                    <button type="submit" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4">Save</button>
                </div>
            </div>

            <div class="schedules-content">
                <div class="form-group row">
                    <label for="title" class="col-sm-2 label-size col-form-label">
                        Title
                    </label>
                    <div class="col-sm-10">
                        <input type="text" id="title" name="title" class="form-control" value="${book.title}"
                               placeholder="Book Title">
                    </div>
                </div>
                <c:forEach items="${book.author}" var="author" varStatus="loop">
                    <div class="form-group row">
                        <label for="author${loop.index}" class="col-sm-2 label-size col-form-label">Author</label>
                        <div class="col-sm-10">
                            <input type="text" id="author${loop.index}" name="author[${loop.index}].fullName"
                                   class="form-control" value="${author.fullName}" placeholder="Book Author">
                            <input type="hidden" id="author${loop.index}" name="author[${loop.index}].id"
                                   class="form-control" value="${author.id}">
                            <a href="#" class="btn btn-danger rounded-0 text-light m-1"
                               onclick="confirmDeleteAuthor(${author.id})">Delete Author</a>
                        </div>
                    </div>
                </c:forEach>
                <div class="form-group row">
                    <label for="isbn" class="col-sm-2 label-size col-form-label">
                        ISBN
                    </label>
                    <div class="col-sm-10">
                        <input type="text" id="isbn" name="isbn" class="form-control" value="${book.isbn}"
                               placeholder="Book ISBN">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="publisherName" class="col-sm-2 label-size col-form-label">
                        Publisher
                    </label>
                    <div class="col-sm-10">
                        <input type="text" id="publisherName" name="publisher.name" class="form-control"
                               value="${book.publisher.name}"
                               placeholder="Book Publisher">
                        <input type="hidden" id="publisherId" name="publisher.id" class="form-control"
                               value="${book.publisher.id}">
                    </div>
                </div>
                <c:forEach items="${book.category}" var="category" varStatus="loop">
                    <div class="form-group row">
                        <label for="category${loop.index}" class="col-sm-2 label-size col-form-label">Category</label>
                        <div class="col-sm-10">
                            <select id="category${loop.index}" name="category[${loop.index}].id" class="form-control">
                                <option value="${category.id}">${category.categoryName}</option>
                            </select>
                            <a href="#" class="btn btn-danger rounded-0 text-light m-1"
                               onclick="confirmDeleteCategory(${category.id})">Delete Category</a>
                        </div>
                    </div>
                </c:forEach>
                <div class="form-group row">
                    <label for="description" class="col-sm-2 label-size col-form-label">
                        Description
                    </label>
                    <div class="col-sm-10">
                                <textarea name="description" class="form-control" rows="5" id="description"
                                          placeholder="Book Description">${book.description}</textarea>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</div>
</section>
<script>
    function confirmDeleteCategory(categoryId) {
        const potwierdzenie = window.confirm("Czy na pewno chcesz usunąć tę kategorię?");
        if (potwierdzenie) {
            const canDelete = sprawdzCategory();
            if (canDelete) {
                deleteCategory('ok', categoryId);
            } else {
                alert("Nie można usunąć. Pole category występuje tylko raz.");
            }
        } else {
            window.location.href = '/app/admin/book/edit/' + ${book.id};
        }
    }

    function sprawdzCategory() {
        const categoryLabels = document.querySelectorAll('label[for^="category"]');
        const categoryLimit = 1;
        return categoryLimit !== categoryLabels.length;
    }

    function deleteCategory(value, categoryId) {
        window.location.href = '/app/admin/delete/category/' + value + '/' + categoryId + '/' + ${book.id};
    }

    function deleteAuthor(value, authorId) {
        window.location.href = '/app/admin/delete/author/' + value + '/' + authorId + '/' + ${book.id};
    }

    function confirmDeleteAuthor(authorId) {
        const potwierdzenie = window.confirm("Czy na pewno chcesz usunąć tego autora?");
        if (potwierdzenie) {
            const canDelete = sprawdzAuthor();
            if (canDelete) {
                deleteAuthor('ok', authorId);
            } else {
                alert("Nie można usunąć. Pole author występuje tylko raz.");
            }
        } else {
            window.location.href = '/app/admin/book/edit/' + ${book.id};
        }
    }

    function sprawdzAuthor() {
        const authorLimit = 1;
        const authorCells = document.querySelectorAll('label[for^="author"]');
        return authorCells.length !== authorLimit;
    }

</script>

<%@ include file="appAdminFooter.jsp" %>
