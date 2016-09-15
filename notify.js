const notifier = require('node-notifier');
const path = require('path');

process.argv.forEach(function (val, index, array) {
  console.log(index + ': ' + val);
});


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

console.log(process.argv);

// --message argument for message argument
// --title   argument for notification title 

// sendNotification('Title', 'deneme');