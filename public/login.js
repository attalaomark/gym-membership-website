document.addEventListener('DOMContentLoaded', function() {
    const loginOption = document.getElementById('login-option');
    const signupOption = document.getElementById('signup-option');
    const loginForm = document.getElementById('login-form');
    const signupForm = document.getElementById('signup-form');

    loginOption.addEventListener('click', function() {
        loginOption.classList.add('active');
        signupOption.classList.remove('active');
        loginForm.classList.add('active');
        signupForm.classList.remove('active');
    });

    signupOption.addEventListener('click', function() {
        signupOption.classList.add('active');
        loginOption.classList.remove('active');
        signupForm.classList.add('active');
        loginForm.classList.remove('active');
    });

    // Set login as default active form
    loginOption.click();
});