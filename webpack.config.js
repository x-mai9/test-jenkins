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