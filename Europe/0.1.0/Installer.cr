class Target < ISM::SemiVirtualSoftware

    def prepareInstallation
        super

        makeDirectory("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}/etc")

        if option("London")
            makeLink(   target: "/usr/share/zoneinfo/Europe/London",
                        path:   "#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}/etc/localtime",
                        type:   :symbolicLinkByOverwrite)
        end
    end

    def uninstall
        super
        #Need to find a way to uninstall properly
    end

end
