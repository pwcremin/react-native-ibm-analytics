import { NativeEventEmitter, NativeModules, Platform } from 'react-native';

let {
    RNAnalytics
} = NativeModules

module.exports = {
    Analytics: {

        /**
         * @param {string}  appName
         * @param {string}  apiKey
         */
        initialize: function ( appName, apiKey )
        {
            RNAnalytics.initialize( appName, apiKey );
        },

        /**
         * @param {string}  userIdentity
         */
        setUserIdentity: function ( userIdentity )
        {
            return RNAnalytics.setUserIdentity( userIdentity );
        },

        disable: function ()
        {
            return RNAnalytics.disable();
        },

        enable: function ()
        {
            return RNAnalytics.enable();
        },

        /**
         * @param {Object}  eventObject
         */
        logAnalytics: function ( eventObject )
        {
            // TODO this needs to be more robust.  logAnalytics only accepts { "key": value } objects
            if ( typeof eventObject !== 'object' || Array.isArray( eventObject ) )
            {
                // TODO error
                return
            }

            return RNAnalytics.logAnalytics( eventObject );
        },

        logLocation: function ()
        {
            return RNAnalytics.logLocation();
        },

        send: function ()
        {
            return RNAnalytics.send();
        }
    },

    Logger: {

        /**
         * @param {string}  message
         */
        fatal: function ( message )
        {
            RNAnalytics.logFatal( message )
        },

        /**
         * @param {string}  message
         */
        error: function ( message )
        {
            RNAnalytics.logError( message )
        },

        /**
         * @param {string}  message
         */

        warn: function ( message )
        {
            RNAnalytics.logWarn( message )
        },

        /**
         * @param {string}  message
         */
        debug: function ( message )
        {
            RNAnalytics.logDebug( message )
        },

        /**
         * @param {string}  message
         */
        info: function ( message )
        {
            RNAnalytics.logInfo( message )
        }
    }
}