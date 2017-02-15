# test-jenkins
  
Jenkins will build the docker image and start a container using that image.  
It then run the test inside container, log the result, and copy the result to Jenkins server and display it.  
  
##To run the test:  
1. Run the test in the Dockerfile with npm = test will be run when building the image  
	-> Test result will be permanent to the image -> not recommend    
    
**RECOMMEND THIS**  
2. Build the image and start a container with the command to run the test  
	-> Test result will be for the container only  

**Makefile basic syntax:** *(tabs does matter - Makefile only takes tabs, not spaces)*  
target: dependencies  
	command1  
    command2  

##Configure HTML Report (or Code Coverage using Istanbul) using Karma + Webpack  
Install karma globally doesn't run using local (dev) dependencies  
-> Will say cannot find module/plugin when use "karma"  
-> Remove karma globally (not sure if needed)
-> Install karma-cli: "npm i -g karma-cli"
  
karma.conf.js: generate by running "karma init [config-filename]"  
e.g. "karma init karma.conf.js"  
  
karma.conf.js requires (wait, sometimes it doesn't require plugin field at all)  
1. plugin: browser Chrome (and any other browser it seems like)  
2. plugin: framework Mocha (others too?)  
3. plugin: reporter Html (others?)
4. add these following for webpack.config.js  

```javascript
// this one is outside module.exports
var webpackConfig = require('./webpack.config.js');

files: [
	'./*js',
	'test/**/*.spec.js'
],
preprocessors: {
	'./*js': ['webpack'],
	'test/**/*.spec.js': ['webpack']
},
webpack: webpackConfig,
webpackMiddleware: {
    // webpack-dev-middleware configuration
    // i.e.
    noInfo: true,
    // and use stats to turn off verbose output
    stats: {
        // options i.e. 
        chunks: false
    }
},

// Don't remove progress - it doesn't run any test if progress is removed
reporters: ['progress', 'coverage', 'html'],
// For html reporter
htmlReporter: {
	outputFile: './test-report.html',
	// Optional 
	pageTitle: 'Unit Tests',
    subPageTitle: 'A sample project description',
    groupSuites: true,
    useCompactStyle: true,
    useLegacyStyle: true
},
// For coverage reporter
coverageReporter = {
  type : 'html',
  dir : 'coverage/'
}
```  
  
##Configure webpack.conf.js *(not really understand this)*  
```javascript
module.exports = {
	/* 
	entry — name of the top level file or set of files that we want to include  
	in our build, can be a single file or an array of files. In our build,  
	we only pass in our main file (app.js).  
  
	output — an object containing your output configuration. In our build, 
	we only specify the filename key (bundle.js) for the name of the file  
	we want Webpack to build.  
	*/
	entry: "./HelloWorld.js",
	output: {
		filename: "hw.js"
  	}
}
``` 
  
Code coverage with Istanbul may not display the coverage result  
--> Have to config some stuffs with babel?  
  
"webpack" in the directory contains HelloWorld.js to run the config.  
