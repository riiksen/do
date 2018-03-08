/- active = context.request.path == "/" ? "active" : ""
/a class="nav-item #{active}" href="/" Home

/a.nav-link href="#" Contact
/a.nav-link href="#" I don't know

/a.brand-logo Logo

/a.nav-link Contact

ul.right.hide-on-med-and-down
  li
    a href="/contact" Contact
  - if context.current_user
    li
      a href="/logout" Logout
    li
      a href="/orders" Orders
  - else
    li
      a href="/login" Login
    li
      a href="/signup" Signup

ul#nav-mobile.side-nav
  li
    a href="/contact" Contact
  - if context.current_user
    li
      a href="/logout" Logout
    li
      a href="/orders" Orders
  - else
    li
      a href="/login" Login
    li
      a href="/signup" Signup

/- if context.current_user

/- else



/- if (current_user = context.current_user)
/  a.nav-item.pull-right href="/signout"
/    | Sign Out
/  - active = context.request.path == "/profile" ? "active" : ""
/  a class="nav-item #{active} pull-right" href="/profile"
/    == current_user.email
/- else
/  - active = context.request.path == "/signup" ? "active" : ""
/  a class="nav-item #{active} pull-right" href="/signup"
/    | Sign Up
/  - active = context.request.path == "/signin" ? "active" : ""
/  a class="nav-item #{active} pull-right" href="/signin"
/    | Sign In
