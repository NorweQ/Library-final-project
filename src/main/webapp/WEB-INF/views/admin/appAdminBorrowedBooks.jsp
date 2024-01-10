<%@ include file="appAdminHeader.jsp"%>

<div class="container pt-4 pb-4">
    <div class="border-dashed view-height">
        <div class="container w-25">
        <form id="borrowedBooks" action="/app/admin/borrow/user" method="post">
            <div class="row border-bottom border-3 p-1 m-1">
                <div class="col noPadding">
                    <h3 class="color-header text-uppercase">Find User</h3>
                </div>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="email" name="email"
                       placeholder="Enter the email">
                <span id="emailError" class="error"></span>
            </div>
            <button type="submit" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4">Find</button>
        </form>
    </div>
</div>
</div>
</div>
</section>

<%@ include file="appAdminFooter.jsp"%>

<script>
    function validateBorrowedBooksForm() {
        validateEmailByAdmin();
        return validateEmailByAdmin();
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
    document.getElementById('borrowedBooks').addEventListener('submit', function (event) {
        if (!validateBorrowedBooksForm()) {
            event.preventDefault();
        }
    });
</script>