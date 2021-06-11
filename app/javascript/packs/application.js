// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
require("./clients")
require("./countries")
require("./statuses")
require("./groupstatuses")
require("./groups")
require("./grouppositions")
require("./projects")
require("./teampositions")
require("./users")
require("./roles")
import 'bootstrap'
import '../stylesheets/application'

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover()
})

globalThis.jQuery = jQuery;
globalThis.$ = $;
