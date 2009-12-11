def getWaveFiles
    Dir.glob 'data/sounds/**/*.wav'
end

def convertWaves
    getWaveFiles.each do |file|
        outfile = file.gsub /wav$/, 'mp3'
        command = "lame #{file} #{outfile}"
        puts command
        if system command then
            FileUtils.rm file
        else
            p $?
        end
    end
end
