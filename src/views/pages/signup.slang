/h1 Sign Up
/
/- if user.errors
/  ul.errors
/  - user.errors.each do |error|
/    li = error.to_s
/
/form action="/signup" method="post"
/  == csrf_tag
/  .form-group
/    input.form-control type="email" name="email" placeholder="Email"
/  .form-group
/    input.form-control type="password" name="password" placeholder="Password"
/  button.btn.btn-primary.btn-xs type="submit"
/    | Register
/<hr/>
/== link_to("Already have an account?", "/signin")

/.row
/  form.col.s12.m6.l3.offset-m3.offset-l4 action="/signup" method="post"
/    == csrf_tag
/    .input-field
/      input.validate#email type="email"
/      label for="email" Email
/    .input-field
/      input.validate#password type="password"
/      label for="password" Password
/    .input-field
/      input.validate#cpassword type="password"
/      label for="cpassword" Confirm password
/== link_to("Already have an account?", "/login")

.container
  .row
    form#reg-form.col.s12 action="/signup" method="post"
      .row
        .input-field.col.s6
          input#first_name.validate required="" type="text" /
          label for="first_name"  First Name
        .input-field.col.s6
          input#last_name.validate required="" type="text" /
          label for="last_name"  Last Name
      .row
        .input-field.col.s12
          input#email.validate required="" type="email" /
          label for="email"  Email
      .row
        .input-field.col.s12
          input#password.validate minlength="6" required="" type="password" /
          label for="password"  Password
      .row
        .col.s6
          .gender-male
            input#male.with-gap name="gender" required="" type="radio" /
            label for="male"  Male
          .gender-female
            input#female.with-gap name="gender" required="" type="radio" /
            label for="female"  Female
        .input-field.col.s6
          button.btn.btn-large.btn-register.waves-effect.waves-light name="action" type="submit" 
            | Register
            i.material-icons.right done

javascript:
  $(document).ready(function() {
    $("select").material_select();
  });