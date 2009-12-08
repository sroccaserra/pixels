
def getMapClassFiles
    Dir.glob '**/Map*.as'
end

def replaceFlixelPackageNameInMapClassFiles
    getMapClassFiles.each do |file|
        command = "sed -i s/com\.adamatomic\.flixel/org.flixel/ #{file}"
        puts command
        system command
        if 0 == $?.exitstatus then
            puts "  '#{file}' \tfixed."
        else
            puts "Error: processing #{file} returned #{$?.exitstatus}"
        end
    end
end
