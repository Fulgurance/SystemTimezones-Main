class Target < ISM::VirtualSoftware

    def install
        super

        if option("London")
            makeLink("/usr/share/zoneinfo/Europe/London","#{Ism.settings.rootPath}/etc/localtime",:symbolicLinkByOverwrite)
        end
    end

    def uninstall
        super

    end

end
