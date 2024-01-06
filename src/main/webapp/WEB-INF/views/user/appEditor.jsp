<%--
  Created by IntelliJ IDEA.
  User: norweq
  Date: 14.12.2023
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="appHeader.jsp" %>

<div class="container pt-4 pb-4">
    <div class="border-dashed view-height">
        <div class="container w-25">
            <h1 class="text-color-darker">Edit Your Data</h1>
            <c:forEach items="${users}" var="user">
                <form action="/app/user/edit/firstName" method="post" onsubmit="return validateFormFirstName()">
                    <div class="form-group">
                        <input type="text" class="form-control" id="firstName" name="firstName"
                               placeholder="${user.firstName}">
                        <span id="firstNameError" class="error"></span>
                        <button class="btn btn-color rounded-0" type="submit">Edit Your First Name</button>
                    </div>
                </form>
                <form action="/app/user/edit/lastName" method="post" onsubmit="return validateFormLastName()">
                    <div class="form-group">
                        <input type="text" class="form-control" id="lastName" name="lastName"
                               placeholder="${user.lastName}">
                        <span id="lastNameError" class="error"></span>
                        <button class="btn btn-color rounded-0" type="submit">Edit Your Last Name</button>
                    </div>
                </form>
                <form action="/app/user/edit/email" method="post" onsubmit="return validateFormEmail()">
                    <div class="form-group">
                        <input type="text" class="form-control" id="email" name="email" placeholder="${user.email}">
                        <span id="emailError" class="error"></span>
                        <button class="btn btn-color rounded-0" type="submit">Edit Your Email</button>
                    </div>
                </form>
                <form action="/app/user/edit/password" method="post" onsubmit="return validateFormPassword()">
                    <div class="form-group">
                        <input type="password" class="form-control" id="password" name="password"
                               placeholder="New password">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="repassword" name="repassword"
                               placeholder="Repeat password">
                        <span id="passwordError" class="error"></span>
                    </div>
                    <button class="btn btn-color rounded-0" type="submit">Edit Your Password</button>
                </form>
            </c:forEach>
        </div>
    </div>
</div>
</div>
</section>
<%@ include file="appFooter.jsp" %>
<script>
    function validateFormEmail() {
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
    function validateFormLastName() {
        const lastName = document.getElementById('lastName').value;
        const lastNameError = document.getElementById('lastNameError');
        if (lastName.trim() === '') {
            lastNameError.innerHTML = 'The Last Name field cannot be empty.';
            return false;
        } else {
            lastNameError.innerHTML = '';
        }
        return true;
    }
    function validateFormFirstName() {
        const lastName = document.getElementById('firstName').value;
        const lastNameError = document.getElementById('firstNameError');
        if (lastName.trim() === '') {
            lastNameError.innerHTML = 'The First Name field cannot be empty.';
            return false;
        } else {
            lastNameError.innerHTML = '';
        }
        return true;
    }
    function validateFormPassword() {
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
</script>