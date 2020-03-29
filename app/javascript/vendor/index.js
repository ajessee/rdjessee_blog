// Load all the js files within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const vendor = require.context('.', true, /.js|.erb$/)
vendor.keys().forEach(vendor)