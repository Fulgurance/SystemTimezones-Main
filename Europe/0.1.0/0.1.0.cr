class Target < ISM::VirtualSoftware

    def install
        super

        #Need to be improved
        if option("London")
            makeLink(   target: "/usr/share/zoneinfo/Europe/London",
                        path:   "/etc/localtime",
                        type:   :symbolicLinkByOverwrite)
        end
    end

    def uninstall
        super
        #Need to find a way to uninstall properly
    end

end
