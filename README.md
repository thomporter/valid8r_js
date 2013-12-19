![Valid8r - Validation for multiple programming languages.](http://www.thomporter.com/valid8r/logo.png)

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

Or install with Bower:

	bower install valid8r_js

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
	    anotherCustomValidator: function(field, error) {
	      return (field != 'someCustomValue') ? 'Please try again.' : ''
	    }
	  }
	}

## Tests

I will be adding Mocha browser test to this repo shortly.
