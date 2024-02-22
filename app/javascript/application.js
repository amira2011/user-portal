// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "popper"
import "bootstrap"
import "jquery"
import "jquery_ujs"
import "./jquery_ui"

$("#notice").fadeOut(4000)

$("#alert").fadeOut(4000)

 $(document).on('click', '.nav-list', function () {
                $(this).addClass("active").siblings().removeClass("active")
                 
            })