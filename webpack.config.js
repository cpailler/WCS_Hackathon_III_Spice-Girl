var Encore = require('@symfony/webpack-encore');

Encore
    .setOutputPath('web/build/')
    .setPublicPath('/web')
    .setManifestKeyPrefix('build/')

    .addEntry('app', './assets/js/app.js')
    .addEntry('style', './assets/scss/main.scss')
    .addEntry('homepage', './assets/scss/homepage.scss')
    .addEntry('homepageJS', './assets/js/homepageJS.js')
    .cleanupOutputBeforeBuild()
    .enableBuildNotifications()
    .enableSassLoader();

module.exports = Encore.getWebpackConfig();