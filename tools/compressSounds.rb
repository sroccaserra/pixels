def getWaveFiles
    Dir.glob 'data/sounds/**/*.wav'
end

def convertWaves
    getWaveFiles.each do |file|
        outfile = file.gsub 'wav', 'mp3'
        command = "lame #{file} #{outfile}"
        puts command
        system command
    end
end
