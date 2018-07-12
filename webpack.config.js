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
    .enableSassLoader();

module.exports = Encore.getWebpackConfig();