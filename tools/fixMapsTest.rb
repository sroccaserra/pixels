require 'test/unit'
require 'tools/fixMaps'

class Tests < Test::Unit::TestCase
    def testWorkingDirectoryIsTheRootOfTheProject
        assert_match /roxel$/, Dir.pwd
    end

    def testMapsClassFilesAreFound
        mapClassFiles = getMapClassFiles
        assert_not_nil mapClassFiles
        assert ! mapClassFiles.empty?
    end

    def testFoundMapClassFilesAreValidFiles
        mapClassFiles = getMapClassFiles
        mapClassFiles.each do |mapClassFile|
            assert File.file? mapClassFile
        end
    end
end
