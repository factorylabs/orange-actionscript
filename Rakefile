require 'sprout'
# Optionally load gems from a server other than rubyforge:
# set_sources 'http://gems.projectsprouts.org'
sprout 'as3'

############################################
# Configure your Project Model
# project_model :model do |m|
  # m.project_name            = 'orange-actionscript'
  # m.language                = 'as3'
  # m.background_color        = '#FFFFFF'
  # m.width                   = 980
  # m.height                  = 580
  # m.use_fdb               = true
  # m.use_fcsh              = true
  # m.preprocessor          = 'cpp -D__DEBUG=false -P - - | tail -c +3'
  # m.preprocessed_path     = '.preprocessed'
  # m.src_dir               = 'src'
  # m.lib_dir               = 'libs'
  # m.swc_dir               = 'libs'
  # m.bin_dir               = 'bin'
  # m.test_dir              = 'test'
  # m.doc_dir               = 'doc'
  # m.asset_dir             = 'assets'
  # m.compiler_gem_name     = 'sprout-flex4sdk-tool'
  # m.compiler_gem_version  = '>= 4.0.0'
  # m.source_path           << "#{m.lib_dir}/somelib"
  # m.libraries             << :corelib
# end

default_size = "980 580"
project_name = "orange-actionscript"
default_framerate = 30


desc 'Compile and debug the application'
debug :debug

desc 'Compile run the test harness'
unit :test

# desc 'Compile the optimized deployment'
# deploy :deploy

##################################

# Define Debug Tasks:

debug_output = "deploy/test.swf"
debug_input = "tests/com/factorylabs/orange/unit/runners/FCoreTestRunner.as"

desc "Compile the #{debug_output} file"
mxmlc "tester" do |t|
  t.input = debug_input
  t.default_size = default_size
  t.default_background_color = "#FFCC00"
  t.source_path << "src"
  t.source_path << "tests"
  t.library_path << "libs"
  t.debug = true
  t.use_fcsh = true
  t.output = debug_output
  # sh 'open http://www.google.com/'
end

desc "Do something"
task :compile => :tester do
  sh 'open http://localhost.factorylabs.com/orange-actionscript/deploy/test.swf'
end


# desc "Launch the #{debug_output} file"
# flashplayer :debug => debug_output do |t|
  # t.swf = debug_output
  # # sh 'open http://www.google.com/'
# endkkkkkkk


##################################
desc 'Create documentation'
document :doc

desc 'Compile a SWC file'
swc :swc

desc 'Compile and run the test harness for CI'
ci :cruise


desc 'Prints information around a task'
task :print do
  puts ENV['FLEX_HOME']
end

# set up the default rake task
task :default => :debug

