class Target < ISM::Software
    
    def prepareInstallation
        super

        makeDirectory("#{builtSoftwareDirectoryPath}/#{Ism.settings.rootPath}/usr/share/zoneinfo")
        makeDirectory("#{builtSoftwareDirectoryPath}/#{Ism.settings.rootPath}/usr/share/zoneinfo/posix")
        makeDirectory("#{builtSoftwareDirectoryPath}/#{Ism.settings.rootPath}/usr/share/zoneinfo/right")

        [   "etcetera",
            "southamerica",
            "northamerica",
            "europe",
            "africa",
            "antarctica",
            "asia",
            "australasia",
            "backward"].each do |timezone|

            runZicCommand(  arguments:  "-L /dev/null -d #{builtSoftwareDirectoryPath}/#{Ism.settings.rootPath}/usr/share/zoneinfo #{timezone}",
                            path:       mainWorkDirectoryPath)

            runZicCommand(  arguments:  "-L /dev/null -d #{builtSoftwareDirectoryPath}/#{Ism.settings.rootPath}/usr/share/zoneinfo/posix #{timezone}",
                            path:       mainWorkDirectoryPath)

            runZicCommand(  arguments:  "-L leapseconds -d #{builtSoftwareDirectoryPath}/#{Ism.settings.rootPath}/usr/share/zoneinfo/right #{timezone}",
                            path:       mainWorkDirectoryPath)
        end

        copyFile(   "#{mainWorkDirectoryPath}/zone.tab",
                    "#{builtSoftwareDirectoryPath}/#{Ism.settings.rootPath}/usr/share/zoneinfo/zone.tab")

        copyFile(   "#{mainWorkDirectoryPath}/zone1970.tab",
                    "#{builtSoftwareDirectoryPath}/#{Ism.settings.rootPath}/usr/share/zoneinfo/zone1970.tab")

        copyFile(   "#{mainWorkDirectoryPath}/iso3166.tab",
                    "#{builtSoftwareDirectoryPath}/#{Ism.settings.rootPath}/usr/share/zoneinfo/iso3166.tab")

        runZicCommand(  arguments:  "-d /usr/share/zoneinfo -p America/New_York",
                        path:       mainWorkDirectoryPath)
    end

end
