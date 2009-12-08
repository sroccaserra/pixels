# (setq compile-command "rake --trace")
require 'tools/fixMaps'

task :default => :build

task :build do
    replaceFlixelPackageNameInMapClassFiles
    sh "mxmlc -sp=src,lib -o build/roxel.swf src/Pixels.as"
end

task :clean do
    rm_rf "build"
end

task :test => :testTools

task :testTools do
    ruby 'tools/*Test.rb'
end
