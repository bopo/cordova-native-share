var exec = require('cordova/exec');

exports.openShare = function (arg0, success, error) {
    exec(success, error, 'nshare', 'openShare', [arg0]);
};
