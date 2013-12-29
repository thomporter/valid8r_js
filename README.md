![Valid8r - Validation for multiple programming languages.](https://raw.github.com/thomporter/valid8r/master/logo.png)

# Valid8r for JavaScript

Valid8r is a validation library for multiple programming languages using a common
JSON configuration file. Learn more about Valid8r and the configuration file
at:

https://github.com/thomporter/valid8r

## Installation

Valid8r for JavaScript really only has one file you need.  If you don't care about
testing, examples, etc, you can simply grab the `valid8r.js` file from the
`lib` folder: 

https://raw.github.com/thomporter/valid8r_js/master/lib/valid8r.js

Alternatively, you can clone this repo and get examples, a Node Server to run them
and the source files (written in CoffeeScript.)

Or install with Bower on the command line:

	bower install valid8r_js
	
Or via a bower.json file:

	{
		"name": "MyApp",
		"dependencies": {
			"valdi8r_js": "*"
		}
	}

## Examples

There is an Express app that will serve up the Kitchen Sink.  You can check 
them out by cloning this repo and running the npm commands:

	git clone https://github.com/thomporter/valid8r_js
	cd valid8r_js
	npm install
	npm start

Here's a quick idea of how it works in JavaScript:

	var Valid8r = new Valid8r;
	config = {
	  bindToBlur: true, // tell Valid8r to check fields as users leave them.
	  form: '#my-form', // let Valid8r control the form submit 
	  rules: rules, // you need to read these in yourself - best to have your sever-side language inject them into the page.
	  callback: function (field,err) {
	    // err will be null if no error was found on field.
	  }
	}
	v = new Valid8r(config)
    

## Custom Validators

Custom validators must either be placed on the special `customValidators` 
property of the Valid8r configuration object, or as global functions attached
to the window.  The former being the recommended method: 

	config = {
	  rules: require('./form_configs/kitchen-sink.json'),
	  data: req.body,
	  customValidators: {
	    customValidator: require('./customValidator'),
	    anotherCustomValidator: function(field, error, cb) {
	      if (field != 'someCustomValue') {
	        cb(field, 'Some Custom Errror');
	        return false;
	      } 
	      cb(field);
          return true;
	    }
	  }
	}

## Asynchronous Validation (via AJAX)
**Updated in v0.0.7** - The Custom Validators in the JavaScript module now
receive a third argument - the callback function.  They are responsible for
calling this function on their own (allowing for asynchronous validation.)
It is important to note that you should make any custom validators performing
asynchronous calls the last rule in their set, and should add an `async` 
property to the rule, equal to `true`:

	{ "rule": "custom", "func":"myAsynchronousValidator", "async":true} 

**Asynchronous validators will not be run on submit!** After all, how silly is 
it to go to the server to validate one piece of data before submitting all of 
the data to the server?

## Mocha Tests

If you access the examples you'll find the Mocah Browser tests.