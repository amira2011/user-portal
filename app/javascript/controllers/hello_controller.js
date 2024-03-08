import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    $(".notice").fadeOut(2000);
    console.log("connected!");
    $(document).on("click", ".nav-menu .menu li ", function () {
      console.log($(this));
      $(".nav-menu .menu li").removeClass("active");
      $(this).addClass("active");
    });
  }
}
