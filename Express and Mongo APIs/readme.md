# Node.js the complete guide to build RESTful APIs

	15 hours Udemy course by Mosh Hamideni
	
#### Content
- Getting started
- Node Module System
- Building RESTful APIs using Express
- Express Advanced Topics
- Asynchronous Javascript
- CRUD Operations using MongoDB
- Mongoose - Data validation
- Mongoose - Modelling Relationships between Connected Data
- Authentication and Authorisation
- Handling and Logging Errors
- Unit Testing
- Integration Testing
- Test-driven Development
- Deployment

---
#### 01 Getting started

##### What is Node?
- An open source and cross platform runtime environment for executing javascript code outside of browser.
- Often used for creating APIs
- Highly scalable, data-intensive and real-time apps
- Great for prototyping and agile development
- Superfast and highly scalable ( Paypal use case )
- Javascript everywhere
- Cleaner and more consistent codebase
- Large ecosystem of open source library

##### Who uses node js?
    
    neteflix, linkedin, paypal, ebay, uber, medium, groupon, nasa, wallmart,trello and many more.

##### Architecture of Node
- Javascript engines are used in various browsers. ( Edge-Chakra, Firefox-SpiderMokey and Chrome-v8)
- Ryan Dahl with google v8 js engine embedded on C++ program created server side runtime environment for js code.
- Node is not a language, not a framework

##### How node works?
- None blocking, aysnchronous Architecture
- Single thread is used to handle multiple requests
- Node is ideal for I/O intensive apps
- Should not be used for CPU intensive 	apps

Install the latest **stable** version

---
#### 02 Node module system
- Core modules - os, fs, events, http

##### Global Object
- In node global is global object. global.console.log()	// part of global object
- In browser window is global object like window.console.log()
- But we use short hands only as its not mandatory to use those prefixes.

##### Modules
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

ES 6 Export Types ( not natively supported on node as its common js )
[Export Types](https://hackernoon.com/import-export-default-require-commandjs-javascript-nodejs-es6-vs-cheatsheet-different-tutorial-example-5a321738b50f)

##### Module wrapper function
- At runtime node converts the module into something like
		
		(function (exports, require, module, __filename, __dirname){
		...
		})()
actually a more complicated than this.

Inbuilt modules

##### Path module
		
		const path = require('path');
		var pathObj = path.parse(__filename);
		console.log(pathObj); // { root: ,dir,base,ext,name }

##### OS module
		
		const os = require('os');
		var totalMemory = os.totalmem();
		var freeMemory = os.freemem();
		console.log('Total Memory '+totalMemory); // mb
		console.log(`Free Memory ${freeMemory}`);
		
##### File System Module
It have syn and async method, prefer to use async methods.
			
		const fs = require('fs');
		const files = fs.readdirSync('./');
		console.log(files) // Array of files
		fs.readdir('./', function(err, files)=>{
			if(err) console.log(err);
			else console.log('Result', files);
		})
		
##### Events Module
Order of occurrence is important.
	const EventEmitter = require('events'); // EventEmitter is a class, container for properties and functions.
	const emitter = new EventEmitter();	// object
	
	// register a listener
	emitter.on('messageLogged', function(arg){	// e, eventArg
		console.log(`Listener called...`, arg);
	});
	
	// raised an event
	emitter.emit('messageLogged',{ id: 1, url: 'http://a' });	// Making a signal with event argument.
	
##### Extending an event emitter

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
	
##### HTTP Module
    
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
	
---
#### 03 Node Package manager
package manager for javascript.  
npm and node are developed independently.  

Creating a projects package.json
- mkdir <project_name>
- cd <project_name>
- npm init _ provide the required details creates a package.json
- skip it with npm init --yes

Installing a node package
    
    npm install <package-name>
    eg _ npm i undersore
  In initial version it was required to add --save suffix to add the npm package to package.json but its no longer required.

Using a package
var _ = require('underscore');
// core module   require('module_name');
// file or folder   require('./module_name');
// node module require('module_name');
First assume core module and then carryforward

Package dependencies
Initially the dependent packages were installed inside the requiring package, that created a lot of redundant data in windows limitation of number of characters of path. Suppose if the version required is different then only it will be stored inside the requiring package.


npm packages and Source Control
No need to commit the dependencies as it is mentioned inside package.json and can installed by npm install
how to exclude from git?
git init
git status
Add file  .gitignore
List all the files in it to exclude to commit in git.
check with git status
git add.
git commit -m 'our first commit'


Semantic versioning
SemVer
MajorVersion.MinorVersion.PatchRelease
[new feature breaking existing functionality].
[Adding new features without breaking existing apis].
[fixing a bug]
^ caret - tells npm we are interest as far as the major version is same = 4.x
~ Tilde we are interested as far as major and minor versions are same = 1.8.x
exact version = '1.8.3'



Listing the installed packages
npm list
npm list --depth=0



Viewing Registry info for a package
npm view <package_name>
npm view <package_name> <property_name> eg_ dependencies, versions



Installing a specific version of a Package
npm install mongoose@2.4.2



Updating Local Packages
npm outdated
npm update // minor and patch releases
npm i -g npm-check-updates
npm-check-updates
npm-check-updates -u


DevDependencies
npm i jshint --save-dev



Unistalling a package
npm uninstall <package_name>
npm un <package_name>


Working with Global packages
npm i -g npm
npm -g outdated



Publishing packages to npm registry
mkdir lion-lib
cd lion-lib
npm init --yes
Create file index.js
 
    module.exports.add = function(a,b){ return a+b }
Create account on npm
npm login and 
npm publish ( be specific to provide unique package name in package.json )



Updating a published package
again
npm publish // will give error
In package.json update the version or
npm version major/minor/patch 
npm publish

---
#### 04 Building RESTful API using Express
Introduction
Express - fast and lightweight API framework

RESTful Services
Client          ---------- HTTP protocol (CRUD) ----------    Server
Representational State Transfer
HTTP methods - GET POST PUT(update) DELETE

Introducing Express
Fast, unopinionated, minimalist web framework for  [node](http://nodejs.org/).


Building your first web server
     
      const express = require('express');
      const app = express();
	  // app.get/put/post/delete
	  app.get('/',(req, res)=>{
			res.send("hey their");	
		})
	  app.get('/api/courses',(req, res)=>{
			res.send([5,6,7])
		})
      app.listen(3000, ()=>console.log('Listening on port 3000'));
[More Req properties](https://expressjs.com/en/4x/api.html#req)


Nodemon
npm i -g nodemon


Environment Variables
For production environment
const port = process.env.port || 3000;
app.listen(port, ()=>console.log(`Listening on port ${port}`));
set port = 5000    // try to run on different ports with env var

##### Route parameter
    
    app.get('api/posts/:year/:month', (req, res){
	    res.send(req.params);
	    // res.send(req.query);
	  })
	Hit the URL localhost:3000/api/posts/2018/1
	localhost:3000/api/posts/2018/1?sortBy=name
	Route Parameters = 2018/1 -essential/req values
	Query String Paramter - sortby=name - anything optional

##### Handling HTTP GET Request

	const courses =[
	{id: 1, name: 'Java'},
	{id: 2, name: 'Node'},
	{id: 3, name: 'Rust'},
	{id: 4, name: 'Go'},
	]

    app.get('/api/courses',(req, res)=>{
		res.send(courses);
	})

    app.get('/api/courses/:id',(req, res)=>{
		const course = courses.find(c => c.id ===parseInt(req.params.id));
		if(!course) res.status(404).send('The required course not  found.');
		else res.send(course)
	})
For 404 error goto browser console network

##### Handling HTTP POST Request

	app.use(express.json()); //adding a piece of middleware
    app.post('/api/courses', (req,res)=>{
		const course = {
			id: courses.length+1,
			name: req.body.name
		};
		courses.push(course);
		res.body(course);
	})

##### Calling endpoints using Postman
Install Postman Chrome App
POST http://localhost:3000/api/courses
Body raw JSON
{
	"name": ".NET"
}
Check status is 200? - request handled successfully

##### Input Validation
Never ever trust what client sends you.
    
    app.use(express.json()); //adding a piece of middleware
    api.post('/api/courses', (req,res)=>{
    if(!req.body.name || req.body.name.length < 3){
		    // 400 Bad Request
		    res.status(400).send("Name required and with min length 3.");
		    return;
	    }
		const course = {
			id: courses.length+1,
			name: req.body.name
		};
		courses.push(course);
		res.body(course);
	})

To make validations easier, we will look joi npm package

    const Joi = require('joi');
	const schema = {
		name: Joi.string().min(3).required();
	}
	const result = Joi.validate(req.body, schema)	    //  body = { "name": "abcd" }

with this you get error and value object.

Thus use Joi to your advantage

    const schema = {
		name: Joi.string().min(3).required()
	}
	const result = Joi.validate(req.body. name);
	
	if(result.error){
		res.status(400).send(result.error.details[0].length);
		return;
	}

##### Handling HTTP PUT Request

    app.put('/api/course/:id', (req,res)=>{
	// Look up the course
	const course = courses.find(c=> c.id === parseInt(req.params.id));
	// If not existing , return 400 - not found
	if(!course) res.status(400).send("We didnt found the course...");
	
	// otherwise validate
	//const result = validateCourse(req.body);
	//Object desctructuring
	const { error } = validateCourse(req.body);
	// if invalid return 404 - bad request
	if(error){
		res.status(404).send(error.details[0].message);
		return;
	}

	course.name = req.body.name;
	res.send(course);
	// Update the course and return the updated course to client
    })

    function validateCourse(course){
	    const schema = { name: Joi.string().min(3).required() }
	    return Joi.validate(course, schema);
    }

##### Handling HTTP DELETE Request

    app.delete('/api/courses/:id',(req,res)=>{
		const course = courses.find(c=> c.id === parseInt(req.params.id));
		// If not existing , return 400 - not found
		if(!course) return res.status(400).send("We didnt found the course...");

		const index = courses.indexOf(course);
		courses.splice(index,1);
		res.send(course);
})


##### Project - Build the Genres API
[Refer](www.prjectravana.node.nodejscompleteguide.practise.index5)

#### 05 Express Advanced Topics
##### Introduction
Middleware
Configuration
Debugging 
Templating Engines and many more

##### Middleware
Express application is essentially a series of middleware calls.
Middleware functions are functions that have access to request object(req), response object and the next middleware function in the application req res cycle.
Every request go through **Request Processing Pipeline** having one or more middleware functions.
Request -------------> [==] [==] -----------------> Response
eg_ json() and route
Middleware can perform following functions
- Execute any code
- Make changes to req and res objects
- End the req res cycle
- call the next middleware function in the stack

Express have following middleware functions -
- Application level ( app.use and app.METHOD )
- Router level ( router.use and router.METHOD )
- Error-handling ( app.use( function(err, req, res, next) ){} )
- Built-in ( express.static, express.json and express.urlencoded )
- Third-party ( like cookie-parser )


##### Creating custom Middleware
    app.use(function(req, res, next){
		console.log('logging...');
		next();			// to pass control to the next middleware function in pipeline
						// try to comment it out and see what happens.
	})
	app.use(function(req, res, next){
		console.log('authenticating...');
		next();
	})
Middleware functions are called in a sequence.

But you are not going to create each function in the index.js, are you?
Create a separate module for it.

    function log(req, res, next){
	    console.log('logging..');
	    next();
	}
	module.exports = log;
Import it in index.js
	
	const logger = require('./logger');
	app.use(logger);

#####  Built-in Middleware
	express.json()
parses the incoming requests with JSON payloads and is based on body-parser
	
	express.urlencoded()
parses incoming req with url encoded payload like req with bodies - key=value&key=value 
POST
http://localhost:3000/api/courses
Body x-www-form-urlencoded 
name and my course

but body-parser deprecated unefined extended
thus
	
	app.use(express.urlencoded({ extended: true }))

express.static()
app.use(express.static('public'));
Create folder express
	readme.txt - this is a readme file.
localhost:3000/readme.txt


##### Third Party Middleware
You should not use every single middleware function cause it will impact performance. So use only whatever needed.
eg-
helmet
npm i --save helmet
const helmet = require('helmet');
app.use(helmet());

morgan
logs http req in cmd
npm i --save morgan
const morgan = require('morgan');
app.use(morgan('tiny'));

Use these middlewares carefully as they will impact the performance.
Such as use morgan for only particaular situation of logging.

##### Environments
console.log(`NODE_ENV: ${process.env.NODE_ENV}`);
console.log(`app: ${app.get('env')}`);	// development by default

Change environment in cmd
set NODE_ENV = production
development/ production/ staging
Use these env to your advantages by setting the third party middleware active only in the required env
if(app.get('env')==='development'){
	app.use(morgan('tiny'));
}

##### Configuration
Storing config settings of the application.
npm package rc
npm i --save config
md config
---deafault.json
	
	{
		"name": "My express App"
	}
---development.json
		
		{
		"name": "My express App --development",
			"mail": {
					"host":"dev-mail-server"
					}
		}
---production.json
	
	{
		"name": "My express App --production",
		"mail": {
				"host":"prod-mail-server"
			}
	}

---index.js

	const config = require('config');
	// configurations
	console.log('Application name: '+config.get('name'));
	console.log('Mail server: '+config.get('mail.host'))
set NODE_ENV = development/production for checking
but should not store application credentials over here like db passwords or mail server password.
Need to store them in environment variables.
set app_password=1234

---custom-environment-variables.json
   
        {
			"mail": {
					"password":"app-password" // env variable
					}
		    }
index.js
    
    console.log("Mail password: "+config.get('mail.password'));

##### Debugging
console.log approach is common but tidious.
npm i --save debug
debug will replace console with env var to enable or disable debugging.
Level of debugging can also be set like for db level only.
---index.js
    
    const startupDebugger = require('debug')('app:startup');
    const dbDebugger = require('debug')('app:db');
    startupDebugger("Morgan enabled");
    dbDebugger("connected to database");
set debug environment according to requirement.
set DEBUG=app:startup.app:db; // messages for both debugging
set DEBUG=app:*;
set DEBUG=app:startup;  // thus only messages for app startup
set DEBUG= // nothing for nothing
a bit of a shortcut like
DEBUG=app:db nodemon index.js
Again you can explore a lot of ways. My personal favourite is setting all these in package.json start command.

##### Templating Engines
Pug(jade), mustache and EJS
npm i pug
---index.js
app.set('view engine','pug');	// no need to require
app.set('views','./views');	// set all your views inside views folder

md views
---index.pug
    
    html
      head
        title= title
      body
        h1=message

---index.js

    app.get('/',(req, res)=>{
		res.render('index',{ title:'a', message: 'b' });		// index.pug
	})     

But really who needs templating engines when you have better options ;)

##### Database Integration
[DB Drivers](https://expressjs.com/en/guide/database-integration.html)


##### Authentication
Authentication is out of scope of express js as express is minimal lighweight framework and doesn't have opinion about authentication

##### Structuring Express Application
Proper structure is required for application scale up.
md routes
--- courses.js

    const express = require('express');
	const router = express.Router();	// app

module.exports = router;

---index,js

    const courses = require('./routes/courses');
	app.use('/api/courses', courses); // for any URL with /api/router use courses router

As the '/api/courses' path is stored in the app.use(), no need to use it in the courses router again, simply remove it.

##### Project - Restructure the app

---
#### 06 Asynchrounous Javascript

##### Synchronous vs asynchronous code
Synchronous Program

    console.log("One");
	console.log("Two");

now the above code is synchronous as its executing 
one after another in a consecutive manner.


Asynchronous Program
	
	console.log("One");
	setTimeout(()=>{ console.log("Two"); },2000)
	console.log("Three");

output will be One Three Two
Aynchronous does not mean concurrent or multi threaded

##### Patterns for dealing with asynchronous code

	console.log("One");
	const user = getUser(1);
	console.log(user);	// undefined
	console.log("Three");
	
	function getUser(id){
		setTimeout(()=>{
			console.log("User ${id} accessing the DB.");
			return { id: id, gitHubusername: 'ajinkya'};
		},2000)
	}

Three patterns to deal with async code
- callback
- promises
- aysnc/await ( syntactical sugar over promises )

##### Callbacks

	console.log('callback pattern -----------');
	console.log('Flag 1');

	getFlag(2, function(obj){
		console.log(`User ${obj}`);
	})

	function getFlag(n, callback){
	setTimeout(()=>{
		console.log(`Flag ${n}`);
		callback({ id: n, user: 'ajinkya'})
	})
	}
	
	console.log('Flag 3');
	console.log('callback pattern -----------');

##### Callback hell
Christmas Tree Problem.
Nested callback functions are complex.
Deeply nested structure


##### Named Functions to rescue
	console.log(`Before`);
	getFlag(1, getRepositories);
	console.log(`After`);

	function getrepositories(user){
	getRepositories(user.gitHubUsername, getCommits);
	}
	
	function getCommits(repos){
	getCommits(repo, displayCommits);
	}
	
	function displayCommits(commits){
	console.log(commits);
	}

	getUser(id, callback){
	setTimeout(()=>{
		console.log(Reading a user from database...);
		callback({id: id, gitHubUsername: 'ajinkya'});
	}, 2000);

##### Promises
Pending ------ async operation -------> fullfilled / rejected

	const p = new Promise((resolve, reject)=>{
	setTimeout(()=>{
		//resolve(1);
		reject(new Error('got an error'));
	},2000);
	});
	
	p
	.then(result=>console.log('Result', result))
	.catch(err=>console.log('Error', err.message));

##### Replacing callbacks with promises

##### Consuming Promises

##### Creating Settled Promises

##### Running Parallel Promises

##### Async and await

##### Exercise

---
#### 07 CRUD Operations Using Javascript
##### Introducing MongoDB

##### Installing mongodb on mac

##### Installing mongodb on windows

##### Connecting to MongoDB

##### Schemas

##### Models

##### Saving a document

##### Querying Documents

##### Comparison Query Operators

##### Logical Query Operators

##### Regular Expressions

##### Counting

##### Pagination

##### Exercise 1

##### Exercise 2

##### Exercise 3

##### Updating Documents-Query First

##### Updating Documents-Update First

##### Removing documents

---
#### 08 Mongoose - Data validations
##### Validation

##### Built-in Validators

##### Custom Validators

##### Aync Validators

##### Validation Errors

##### Schema Type Options

##### Project - Add Persistence to Genres API

##### Project - Build the Customers API

##### Restructuring the cables
 

---
#### 09 Mongoose - Modelling relashionships between Connected Data

##### Modelling Relationships

##### Referencing Documents

##### Population

##### Embedding documents

##### Using an array of Sub-documents

##### Project - Build the Movies API

##### Project - Build the Rental API

##### Transaction

##### ObjectID

##### Validating Object IDs

##### A better implementation

---
#### 10 Authentication and Authorization

##### Introduction

##### Creating the user model

##### Registering Users

##### Using Lodash

##### Hashing Passwords

##### Authenticating Users

##### Testing the Authentication

##### JSON web tokens

##### Generating Authentication Tokens

##### Storing secrets in Environment Variables

##### Setting Response Headers

##### Encapsulating Logic in Mongoose Models

##### Authorizing Middle-ware

##### Protecting routes

##### Getting the current user

##### Logging out users

##### Role based Authorization

##### Testing the Authorization

---
#### 11 Handling and Logging errors

##### Introduction

##### Handling Rejected Promises

##### Express Error Middleware

##### Removing try-catch docs

##### Express Async Errors

##### Logging Errors

##### Logging  to MongoDB

##### Uncaught Exceptions

##### Underhandled Promise Rejections

##### Error Handeling Recap

##### Refactoring index.js - Extracting Routes

##### Extracting DB Logic

##### Logging

##### Extracting the config logic

##### Extracting the validation logic

##### Showing unhandeled Exceptions in the console


---
#### 12 Unit Testing

##### What is Automated Testing

##### Benefits of Automated testing

##### Types of tests

##### Test Pyramid 

##### Tooling

##### Writing Your First unit Test

##### Testing Numbers

##### Grouping Tests

##### Refactoring with Confidence

##### Testing Strings

##### Testing Arrays

##### Testing Objects

##### Testing Exceptions

##### Continually Running Tests

##### Exercise - Testing the FizzBuzz

##### Creating Simple Mock Functions

##### Interaction Testing

##### Jest Mock Function

##### What to Unit Test

##### Exercise

---
#### 13 Integration Testing

##### Introduction

##### Preparing the App

##### Setting up the Test DB

##### Your first Integration Test

##### Populating the Test DB

##### Testing Routes with Parameters

##### Validating Object IDs

##### Refactoring with confidence

##### Testing the Authorization

##### Testing Invalid Inputs

##### Testing the Happy Paths

##### Writing Clean Tests

##### Testing the Auth Middleware

##### Unit testing the Auth Middleware

##### Code Coverage

##### Exercise

---
#### 14 Test-driven Development

##### What is Test-driven approach

##### Implementing the Returns

##### Test cases

##### Populating the Database

##### Testing the Authorization

##### Testing the input

##### Refactoring Tests

##### Looking Up an object

##### Testing if Rental processed

##### Testing the Valid Request

##### Testing the Return Date

##### Testing the Rental fee

##### Testing the movie stock

##### Testing the Response

##### Refactoring the validation logic

##### Mongoose Static Methods

##### Refactoring the Domain Logic

---
#### 15 Deployment

##### Introduction

##### Preparing the App for Production

##### Getting started with Heroku

##### Preparing the App for deployment

##### Adding the code to a git repository

##### Deploying to Heroku

##### Viewing logs

##### Setting environment variables

##### MongoDB in the cloud

---


---

# Extra Footnotes
