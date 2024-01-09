<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="appAdminHeader.jsp" %>

<div class="container pt-4 pb-4">
    <div class="border-dashed view-height">
        <div class="container w-25">
                <form id="registrationByAdmin" action="/app/admin/register" method="post" onsubmit="return validateUserAddedByAdminForm()">
                    <h1 class="text-color-darker">Registration</h1>
                    <div class="form-group">
                        <input type="text" class="form-control" id="firstName" name="firstName"
                               placeholder="Enter the first name">
                        <span id="firstNameError" class="error"></span>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="lastName" name="lastName"
                               placeholder="Enter the surname">
                        <span id="lastNameError" class="error"></span>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="email" name="email" placeholder="Enter the email">
                        <span id="emailError" class="error"></span>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="password" name="password"
                               placeholder="Password">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="repassword" name="repassword"
                               placeholder="Confirm the password">
                        <span id="passwordError" class="error"></span>
                    </div>
                    <div class="form-group">
                            <select id="isAdmin" name="isAdmin" class="form-control">
                                <option value="">Select</option>
                                <option value="Admin">The user is an admin</option>
                                <option value="User">The user is not an admin</option>
                            </select>
                        <span id="selectAdminError" class="error"></span>
                    </div>
                    <button class="btn btn-color rounded-0" type="submit">Register</button>
                </form>
            </div>
        </div>
    </div>
</div>
</section>
<%@ include file="appAdminFooter.jsp" %>

<script>
    function validateUserAddedByAdminForm() {
        validFirstNameByAdmin();
        validLastNameByAdmin();
        validateEmailByAdmin();
        validatePasswordByAdmin();
        validQuestionUserIsAdmin();
        return validFirstNameByAdmin() &&
            validLastNameByAdmin() &&
            validateEmailByAdmin() &&
            validatePasswordByAdmin() &&
            validQuestionUserIsAdmin();
    }
    function validFirstNameByAdmin() {
        const author = document.getElementById('firstName').value;
        const authorError = document.getElementById('firstNameError');
        if (author.trim() === '') {
            authorError.innerHTML = 'The First Name field cannot be empty.';
            return false;
        } else {
            authorError.innerHTML = '';
            return true;
        }
    }
    function validLastNameByAdmin() {
        const author = document.getElementById('lastName').value;
        const authorError = document.getElementById('lastNameError');
        if (author.trim() === '') {
            authorError.innerHTML = 'The Surname field cannot be empty.';
            return false;
        } else {
            authorError.innerHTML = '';
            return true;
        }
    }
    function validateEmailByAdmin() {
        const email = document.getElementById('email').value;
        const emailError = document.getElementById('emailError');
        if (email.trim() === '') {
            emailError.innerHTML = 'The Email filed cannot be empty.';
            return false;
        } else {
            emailError.innerHTML = '';
        }
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(email)) {
            emailError.innerHTML = 'This email is incorrect.';
            return false;
        } else {
            emailError.innerHTML = '';
        }
        return true;
    }
    function validQuestionUserIsAdmin() {
        const author = document.getElementById('isAdmin').value;
        const authorError = document.getElementById('selectAdminError');
        if (author.trim() === '') {
            authorError.innerHTML = 'The Category field cannot be empty.';
            return false;
        } else {
            authorError.innerHTML = '';
            return true;
        }
    }
    function validatePasswordByAdmin() {
        const password = document.getElementById('password').value;
        const repassword = document.getElementById('repassword').value;
        const passwordError = document.getElementById('passwordError');

        if (password.trim() === '' || repassword.trim() === '') {
            passwordError.innerHTML = 'Both password fields are required.';
            return false;
        } else {
            passwordError.innerHTML = '';
        }
        if (password !== repassword) {
            passwordError.innerHTML = 'Passwords do not match.';
            return false;
        } else {
            passwordError.innerHTML = '';
        }
        return true;
    }
    document.getElementById('registrationByAdmin').addEventListener('submit', function (event) {
        if (!validateUserAddedByAdminForm()) {
            event.preventDefault();
        }
    });
</script>