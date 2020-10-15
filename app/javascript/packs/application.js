// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
import 'cocoon-js'

import 'bootstrap'
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
$(function() {
    // limits the number of categories
    $('#items').on('cocoon:after-insert', function() {
        check_to_hide_or_show_add_link();
    });

    $('#items').on('cocoon:after-remove', function() {
        check_to_hide_or_show_add_link();
    });

    check_to_hide_or_show_add_link();

    function check_to_hide_or_show_add_link() {
        if ($('#items .nested-fields').length == 5) {
            $('#add-item a').hide();
        } else {
            $('#add-item a').show();
        }
    }
})