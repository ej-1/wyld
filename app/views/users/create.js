
user_error = $("<%= j render(:partial => 'signup_page') %>");

$('.signup-form').replaceWith(user_error);


$(".field_with_errors .form-control").unwrap(); // Workaround to remove div messing up design when captcha fails.
$(".field_with_errors .captcha-field").unwrap(); // Workaround to remove div messing up design when captcha fails.
$(".field_with_errors .captcha-question-text").unwrap(); // Workaround to remove div messing up design when captcha fails.


$('.error-body ').fadeIn( 700, function() {

 });
