// Grunt is a command-line build tool for web applications.
// This Gruntfile defines a few tasks that convert the files
// in the "src" folder into regular Javascript in the "_js"
// folder. It is run on the server after the code is pushed
// by the ./postinstall.sh script.

module.exports = (function(grunt) {
  grunt.initConfig({
  connect: {
    server: {
      options: {
        keepalive:true,
        port: 9001,
        base: './'
      }
    }
  }
  });
  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.registerTask('default', ['connect']);
});
