var Encore = require('@symfony/webpack-encore');

Encore
    .setOutputPath('web/build/')
    .setPublicPath('/web')
    .addEntry('app', './assets/js/app.js')
    .addEntry('style', './assets/scss/main.scss')

    .addEntry('css/stylegame', './assets/scss/stylegame.scss')
    .addEntry('js/stylegame', './assets/js/stylegame.js')

    .cleanupOutputBeforeBuild()
    .enableBuildNotifications()
    .enableSassLoader()

// allows legacy applications to use $/jQuery as a global variable
    .autoProvidejQuery()

// this creates a 'jquery_jqueryUi.js' file with jquery and the jQuery UI module
    .createSharedEntry('jquery_jqueryUi', ['jquery', 'jquery-ui']);


module.exports = Encore.getWebpackConfig();