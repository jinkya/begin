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

Who uses node js?
    
    neteflix, linkedin, paypal, ebay, uber, medium, groupon, nasa, wallmart,trello and many more.

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

ES 6 Export Types ( not natively supported on node as its common js )
[Export Types](https://hackernoon.com/import-export-default-require-commandjs-javascript-nodejs-es6-vs-cheatsheet-different-tutorial-example-5a321738b50f)

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
npm publish // will give erroe
In package.json update the version or
npm version major/minor/patch 
npm publish


#### 04 Building RESTful API using Express
Introduction
Express - fast and lightweight API framework

RESTful Services
Client          ---------- HTTP protocol (CRUD) ----------    Server
Representational State Transfer
HTTP methods - GET POST PUT(update) DELETE

Introducing Express
Fast, unopinionated, minimalist web framework for  [node](http://nodejs.org/).

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



[link text](#abcd)


**bold**
*italic*

# First Level Heading
#### Fourth Level Heading
Creatin a horizpntal rule below
*** 
    Code with 4 spaces indentation
Images
![alt Text](http://path.to.img "Title")

Force a line break with 2 space  
next line

Providing link
[link text](http://example.com)

Creating a list
* 1
- 2
+ 3

Nested list requires four space indentation
* rootList
    - subRoot 1
    - subRoot 2
* and it goes on...

<a name="abcd">
I am calling
</a>


***
**56 hours** per week
***
**Targets**
Javascript, Typescript, Dart, CSS, Bootstrap 4, Angular, Java, Node, Flutter, AWS, network penetration and ALdS
***
**Materials**
- **Javacript** (953 pages) +  ( 17 hour videos ) + ( Implementation 10 hour )[39]
- **Typescript** ( 7 hour max udemy video ) [10]
- **Dart** ( yet to decide ) [ 12 ]
- **Angular** ( 28 hour videos ) + ( Model implementation 10 hours ) [40]
- **Node**  ( 31 hour videos ) + Implementation ( 6 hours ) [37]
- **AWS** ( 13.50 hours ) + ( 6 hours exam preparation ) [20]
- **CSS** ( yet to find ) [6]
- **Bootstrap 4** ( Lynda - 10 hours ) [12]
- **Flutter** ( 30 hour video ) ( Model Implementation - 15 hours ) [45]
- **Java** ( 77 hour videos ) ( Model Implementations - 10 hours ) [87]
- **Network Penetration** ( 6 hour videos ) ( Implementation 5 hours ) [11]
- **ALdS** ( 6.042J 33 hours 6.006 42 hours 6.046 40 hours ) [ 115 ]
***

**Current Target**
-  Javascript ( 40 hours )
- Angular ( 40 hours )
- AWS ( 20 hours )
- Flutter ( 45 hours )

***

Burp Intruder
OWASP
