# (setq compile-command "rake --trace")
require 'tools/fixMaps'
require 'tools/compressSounds'

task :default => :build

task :build do
    replaceFlixelPackageNameInMapClassFiles
    convertWaves
    sh "mxmlc -sp=src,lib -o build/pixels.swf src/Pixels.as"
end

task :clean do
    rm_rf "build"
end

task :test => :testTools

task :testTools do
    ruby 'tools/*Test.rb'
end

