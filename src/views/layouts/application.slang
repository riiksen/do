doctype html
html
  head
    title Title
    meta charset="utf-8"
    meta http-equiv="X-UA-Compatible" content="IE=edge"
    link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"
    link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css"
    link rel="stylesheet" href="assets/main.css"/
    meta name="viewport" content="width=device-width, initial-scale=1.0"
  body
    nav.white role="navigation"
      .nav-wrapper.container
        a.brand-logo href="/" Logo
        == render(partial: "layouts/_nav.slang")
        a.button-collapse data-activates="nav-mobile"
          i.material-icons menu
    
    .container
      - flash.each do |key, value|
        .row
          .s12.m5
            class="card-panel yellow"
              p = flash[key]
      .section
        == content

    script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"
    script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"
    javascript:
      $(document).ready(function() {
        $(".button-collapse").sideNav();
      });