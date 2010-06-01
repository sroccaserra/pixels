# (setq compile-command "rake --trace")
require 'tools/fixMaps'
require 'tools/compressSounds'

$flexunit = 'libs/flexunit/flexunit-4.0.0.swc,libs/flexunit/flexunit-uilistener-4.0.0.swc'

task :default => :build

task :build do
    replaceFlixelPackageNameInMapClassFiles
    convertWaves
    sh "mxmlc -static-link-runtime-shared-libraries=true -sp=src,libs -o build/pixels.swf src/Pixels.as"
end

task :clean do
    rm_rf "build"
end

task :test => :testTools

task :testTools do
    ruby 'tools/*Test.rb'
end

task :testFlex do
    sh "mxmlc -static-link-runtime-shared-libraries=true -sp=src,libs,test -library-path+=#{$flexunit} -o build/tests.swf test/TestRunner.mxml"
end
