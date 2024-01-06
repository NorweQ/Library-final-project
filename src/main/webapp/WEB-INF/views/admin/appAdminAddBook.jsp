<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 25.11.2023
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="appAdminHeader.jsp" %>

<div class="m-4 p-3 width-medium">
    <div class="dashboard-content border-dashed p-3 m-4 view-height">
        <form id="bookForm" action="/app/admin/book/add" method="post" onsubmit="return validateBookForm()">
            <div class="row border-bottom border-3 p-1 m-1">
                <div class="col noPadding">
                    <h3 class="color-header text-uppercase">Add Book</h3>
                </div>
                <div class="col d-flex justify-content-end mb-2">
                    <button type="submit" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4">Add Book</button>
                </div>
            </div>

            <div class="schedules-content">
                <div class="form-group row">
                    <label for="title" class="col-sm-2 label-size col-form-label">
                        Title
                    </label>
                    <div class="col-sm-10">
                        <input type="text" id="title" name="title" class="form-control"
                               placeholder="Book Title">
                        <span id="titleError" class="error"></span>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="author" class="col-sm-2 label-size col-form-label">
                        Author
                    </label>
                    <div class="col-sm-10">
                        <input type="text" id="author" name="author" class="form-control"
                               placeholder="Book Author">
                        <span id="authorError" class="error"></span>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 label-size col-form-label">
                    </label>
                    <div class="col-sm-10">
                        <button type="button" onclick="addAuthor()">Add Author</button>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="isbn" class="col-sm-2 label-size col-form-label">
                        ISBN
                    </label>
                    <div class="col-sm-10">
                        <input type="text" id="isbn" name="isbn" class="form-control"
                               placeholder="Book ISBN">
                        <span id="isbnError" class="error"></span>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="publisher" class="col-sm-2 label-size col-form-label">
                        Publisher
                    </label>
                    <div class="col-sm-10">
                        <input type="text" id="publisher" name="publisher.name" class="form-control"
                               placeholder="Book Publisher">
                        <span id="publisherError" class="error"></span>
                    </div>
                </div>
                <div class="form-group row" id="category-group">
                    <label for="category" class="col-sm-2 label-size col-form-label">
                        Category
                    </label>
                    <div class="col-sm-10">
                        <select id="category" class="select" name="category">
                            <option value="">Select Category</option>
                            <c:forEach items="${categories}" var="category">
                                <option value="${category.id}">${category.categoryName}</option>
                            </c:forEach>
                        </select>
                        <span id="categoryError" class="error"></span>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 label-size col-form-label">
                    </label>
                    <div class="col-sm-10">
                        <button type="button" onclick="addCategory()">Add Category</button>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="description" class="col-sm-2 label-size col-form-label">
                        Description
                    </label>
                    <div class="col-sm-10">
                                <textarea name="description" class="form-control" rows="5" id="description"
                                          placeholder="Book Description"></textarea>
                    </div>
                    <span id="descriptionError" class="error"></span>
                </div>

            </div>
        </form>

    </div>
</div>
</div>
</section>


<%@ include file="appAdminFooter.jsp" %>
<script>
    function validateBookForm() {
        validAuthor();
        validTitle();
        validIsbn();
        validDescription();
        validPublisher();
        validCategory();
        return validAuthor() &&
            validTitle() &&
            validIsbn() &&
            validDescription() &&
            validPublisher() &&
            validCategory();
    }

    function validAuthor() {
        const author = document.getElementById('author').value;
        const authorError = document.getElementById('authorError');
        if (author.trim() === '') {
            authorError.innerHTML = 'The Author field cannot be empty.';
            return false;
        } else {
            authorError.innerHTML = '';
            return true;
        }
    }

    function validTitle() {
        const author = document.getElementById('title').value;
        const authorError = document.getElementById('titleError');
        if (author.trim() === '') {
            authorError.innerHTML = 'The Title field cannot be empty.';
            return false;
        } else {
            authorError.innerHTML = '';
            return true;
        }
    }

    function validIsbn() {
        const author = document.getElementById('isbn').value;
        const authorError = document.getElementById('isbnError');
        if (author.trim() === '') {
            authorError.innerHTML = 'The ISBN field cannot be empty.';
            return false;
        } else {
            authorError.innerHTML = '';
            return true;
        }
    }

    function validDescription() {
        const author = document.getElementById('description').value;
        const authorError = document.getElementById('descriptionError');
        if (author.trim() === '') {
            authorError.innerHTML = 'The Description field cannot be empty.';
            return false;
        } else {
            authorError.innerHTML = '';
            return true;
        }
    }

    function validPublisher() {
        const author = document.getElementById('publisher').value;
        const authorError = document.getElementById('publisherError');
        if (author.trim() === '') {
            authorError.innerHTML = 'The Publisher field cannot be empty.';
            return false;
        } else {
            authorError.innerHTML = '';
            return true;
        }
    }

    function validCategory() {
        const author = document.getElementById('category').value;
        const authorError = document.getElementById('categoryError');
        if (author.trim() === '') {
            authorError.innerHTML = 'The Category field cannot be empty.';
            return false;
        } else {
            authorError.innerHTML = '';
            return true;
        }
    }

    document.getElementById('bookForm').addEventListener('submit', function (event) {
        if (!validateBookForm()) {
            event.preventDefault();
        }
    });

    function addAuthor() {
        const authorField = document.querySelector('#author');
        const newAuthorField = authorField.cloneNode(true);
        authorField.parentNode.insertBefore(newAuthorField, authorField);
    }

    function addCategory() {
        const categorySelect = document.getElementById('category');
        const newCategorySelect = categorySelect.cloneNode(true);
        categorySelect.parentNode.appendChild(newCategorySelect);
        categorySelect.parentNode.appendChild(document.createElement('br'));
    }
</script>
