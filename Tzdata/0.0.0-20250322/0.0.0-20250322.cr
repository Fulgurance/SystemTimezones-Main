class Target < ISM::Software
    
    def build
        super

        makeSource( path: buildDirectoryPath,
                    environment: {"CC" => "gcc"})
    end

    def prepareInstallation
        super

        makeSource( arguments:   "DESTDIR=#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath} install",
                    path:       buildDirectoryPath)
    end

end
