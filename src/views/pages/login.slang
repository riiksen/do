.container
  .row
    .col.s12.m6.offset-m3
      .card-panel.z-depth-5
        == form(action: "/login", method: :post) do
          .row.input-field
            i.material-icons.prefix mail_outline
            input#email.validate type="email" name="email" /
            label for="email" Email
          .row.input-field
            i.material-icons.prefix lock_outline
            input#password.validate type="password" name="password" /
            label for="password" Password
          .row
            input#remember-me type="checkbox" name="remember-me" /
            label for="remember-me" Remember me
          .row.input-field
            button.btn.waves-effect.col.s12 type="submit" Login
            /input type="submit" Login
          .row
            a href="/signup" Register now!
            a.right href="/forgot" Forgot password?