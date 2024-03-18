import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    $(".notice").fadeOut(2000);
    console.log("connected!");
  }
}
