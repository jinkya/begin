# Node.js the complete guide to build RESTful APIs

	Udemy course by Mosh Hamideni
	

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
- At runtime node converts the module into something like
		
		(function (exports, require, module, __filename, __dirname){
		...
		})()
actually a more complicated than this.

Inbuilt modules

Path module
		
		const path = require('path');
		var pathObj = path.parse(__filename);
		console.log(pathObj); // { root: ,dir,base,ext,name }

OS module
		
		const os = require('os');
		var totalMemory = os.totalmem();
		var freeMemory = os.freemem();
		console.log('Total Memory '+totalMemory); // mb
		console.log(`Free Memory ${freeMemory}`);
		
File System Module
It have syn and async method, prefer to use async methods.
			
		const fs = require('fs');
		const files = fs.readdirSync('./');
		console.log(files) // Array of files
		fs.readdir('./', function(err, files)=>{
			if(err) console.log(err);
			else console.log('Result', files);
		})
		
Events Module
Order of occurrence is important.
	const EventEmitter = require('events'); // EventEmitter is a class, container for properties and functions.
	const emitter = new EventEmitter();	// object
	
	// register a listener
	emitter.on('messageLogged', function(arg){	// e, eventArg
		console.log(`Listener called...`, arg);
	});
	
	// raised an event
	emitter.emit('messageLogged',{ id: 1, url: 'http://a' });	// Making a signal with event argument.
	
Extending an event emitter

logger.js

    const EventEmitter = require('events');
            
    var url = "http://mylogger.io/log";
	
	class Logger extends EventEmitter {
	log(message){
		// send a HTTP request
		console.log(message);
		// Riase an event
	    this.emit('messageLogged', { id: 1, url: 'https://abc.xyz/'})
	}
	}
	
	module.exports = Logger;


app.js

    const EventEmitter = require('events');
    		
	const Logger = require('./logger');
	const logger = new Logger();
	
		// Register a Listener
	logger.on('messageLogged', (arg)=>{
		console.log('Listener called ',arg);
	});


	logger('message');
	
HTTP Module
    
    const http = require('http');
	
	const server = http.createServer((req, res)=>{
		if (req.url === '/'){
			res.wtite('Hello, Did you called me');
			res.end();
		}
		
		if(req.url === '/api/cources'){
			res.write(JSON.stringify([1,2,3]));
			res.end();
		}
	}); // an event emiiter type
	
	// server.on('connection', (socket)=>{
	// 	console.log('new connection...');
	// })
	
	server.listen(3000);
	console.log('Listenning on port 3000...');
	
	
#### 03 Node Package manager
package manager for javascript.  
npm and node are developed independently.  

Creating a projects package.json
- mkdir <project_name>
- cd <project_name>
- npm init _ provide the required details creates a package.json
- skip it with npm init --yes

Installing a node package
    
    npm i <package-name>

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

