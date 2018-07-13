// require jQuery normally
const $ = require('jquery');
require('jquery-ui');
require('webpack-jquery-ui');

// create global $ and jQuery variables
global.$ = global.jQuery = $;

import 'webpack-jquery-ui';

$(document).ready(function () {
    console.log("ok, JQuery fonctionne !");
});