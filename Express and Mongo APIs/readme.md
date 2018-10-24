#### 01 Getting started
What is Node?
- An open source and cross platform runtime environment for executing javascript code outside of browser.
- Often used for creating APIs
- Highly scalable, data-intensive and real-time apps
- Great for prototyping and agile development
- Superfast and highly scalable ( Paypal use case )
- Javascript everywhere
- Cleaner and more consistent codebase
- Large ecosystem of open source library

Architecture of Node
- Javascript engines are used in various browsers. ( Edge-Chakra, Firefox-SpiderMokey and Chrome-v8)
- Ryan Dahl with google v8 js engine embedded on C++ program created server side runtime environment for js code.
- Node is not a language, not a framework

How node works?
- None blocking, aysnchronous Architecture
- Single thread is used to handle multiple requests
- Node is ideal for I/O intensive apps
- Should not be used for CPU intensive 	apps

Install the latest **stable** version

#### 02 Node module system
- Core modules - os, fs, events, http

Global Object
- In node global is global object. global.console.log()	// part of global object
- In browser window is global object like window.console.log()
- But we use short hands only as its not mandatory to use those prefixes.

Modules
- Create a modular approach for the app
- Every file in node app is considered as module and any variables inside that module are scoped to that module.
- console.log(module);

Creating a module
file1.js
		
		function log(message){
			console.log(message);
		}
		module.exports.log = log;
		// module.exports.endPoint = url;

Loading a module
file2.js
			
			var logger = require('./file1')
			console.log(logger);
Best practice - Make the imported as constant..


Module wrapper function

#### 03 Node Package manager
#### 04 Building RESTful API using Express
#### 05 Express Advanced Topics
#### 06 Asynchrounous Javascript
#### 07 CRUD Operations Using Javascript
#### 08 Mongoose - Data validations
#### 09 Mongoose - Modelling relashionships between Connected Data
#### 10 Authentication and Authorisation
#### 11 Handeling and Logging errors
#### 12 Unit Testing
#### 13 Integration Testing
#### 14 Test-driven Development
#### 15 Deployment
