require('coffee-script');
var fakemon = require('./fakemon');

if(process.argv.length > 2 && process.argv[2]){
  if(process.argv[2] === 'fakemon')
    setInterval( function() {
      fakemon();
    }, 10000);
}

