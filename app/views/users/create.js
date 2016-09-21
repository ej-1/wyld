
user_error = $("<%= j render(:partial => 'signup_page') %>");

$('.signup-form').replaceWith(user_error);

$('.error-body ').fadeIn( 700, function() {

 });
