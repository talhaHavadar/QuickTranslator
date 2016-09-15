const notifier = require('node-notifier');
const path = require('path');


var sendNotification = function(title, message, icon) {

    icon = icon || undefined;
    
    notifier.notify({
        title: title,
        message: message,
        icon: icon, //path.join(__dirname, 'coulson.jpg'), // Absolute path (doesn't work on balloons)
        sound: true, // Only Notification Center or Windows Toasters
        wait: true // Wait with callback, until user action is taken against notification
    }, function(err, response) {

    });

    notifier.on('click', function (notifierObject, options) {
        // Triggers if `wait: true` and user clicks notification
    });

    notifier.on('timeout', function (notifierObject, options) {
        // Triggers if `wait: true` and notification closes
    });

};

// --message argument for message argument
// --title   argument for notification title 
function parseArguments(argsArr) {
    var args = {};

    argsArr.forEach(function (val, index, array) {
        if(val.indexOf('--message=') != -1) {
            args.message = val.split('=')[1];
        } else if (val.indexOf('--title=') != -1) {
            args.title = val.split('=')[1];
        }
    });

    return args;
}

var args = parseArguments(process.argv);
console.log('parsed', args);
sendNotification(args.title, args.message);