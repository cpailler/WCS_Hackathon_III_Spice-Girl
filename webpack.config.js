var Encore = require('@symfony/webpack-encore');

Encore
    .setOutputPath('web/build/')
    .setPublicPath('/web')
    .setManifestKeyPrefix('build/')

    .addEntry('app', './assets/js/app.js')
    .addEntry('style', './assets/scss/main.scss')

    .addEntry('css/stylegame', './assets/scss/stylegame.scss')
    .addEntry('js/stylegame', './assets/js/stylegame.js')
    .addEntry('css/gameover', './assets/scss/gameover.scss')

    // Transfert des images dans build/images.
    .addEntry('images/ampoule_ga', './assets/images/ampoule_ga.png')
    .addEntry('images/cheminee_ga', './assets/images/cheminee_ga.png')
    .addEntry('images/femme_ga', './assets/images/femme_ga.png')
    .addEntry('images/grand_asthme', './assets/images/grand_asthme.png')
    .addEntry('images/homme_ga', './assets/images/homme_ga.png')
    .addEntry('images/pluie_ga', './assets/images/pluie_ga.png')
    .addEntry('images/usine2_ga', './assets/images/usine2_ga.png')
    .addEntry('images/usine_ga', './assets/images/usine_ga.png')
    .addEntry('images/voiture_ga', './assets/images/voiture_ga.png')
    .addEntry('images/piggy_bank', './assets/images/piggy_bank.png')
    .addEntry('images/dollar', './assets/images/dollar.png')
    .addEntry('images/fleche_ga', './assets/images/fleche_ga.png')


    .addEntry('homepage', './assets/scss/homepage.scss')
    .cleanupOutputBeforeBuild()
    .enableBuildNotifications()
    .enableSassLoader()

    .configureBabel(function(babelConfig) {
        // add additional presets
        babelConfig.presets.push('es2017');

        // no plugins are added by default, but you can add some
        // babelConfig.plugins.push('styled-jsx/babel');
    })

// allows legacy applications to use $/jQuery as a global variable
    .autoProvidejQuery()

// this creates a 'jquery_jqueryUi.js' file with jquery and the jQuery UI module
    .createSharedEntry('jquery_jqueryUi', ['jquery', 'jquery-ui']);


module.exports = Encore.getWebpackConfig();