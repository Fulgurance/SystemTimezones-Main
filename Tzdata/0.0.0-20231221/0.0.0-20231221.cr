class Target < ISM::Software
    
    def prepareInstallation
        super

        makeDirectory("#{builtSoftwareDirectoryPath(false)}/#{Ism.settings.rootPath}/usr/share/zoneinfo")
        makeDirectory("#{builtSoftwareDirectoryPath(false)}/#{Ism.settings.rootPath}/usr/share/zoneinfo/posix")
        makeDirectory("#{builtSoftwareDirectoryPath(false)}/#{Ism.settings.rootPath}/usr/share/zoneinfo/right")

        [   "etcetera",
            "southamerica",
            "northamerica",
            "europe",
            "africa",
            "antarctica",
            "asia",
            "australasia",
            "backward"].each do |timezone|

            runZicCommand(["-L","/dev/null","-d","/usr/share/zoneinfo/",timezone], mainWorkDirectoryPath)
            runZicCommand(["-L","/dev/null","-d","/usr/share/zoneinfo/posix",timezone], mainWorkDirectoryPath)
            runZicCommand(["-L","leapseconds","-d","/usr/share/zoneinfo/right",timezone], mainWorkDirectoryPath)
        end

        copyFile("#{mainWorkDirectoryPath(false)}/zone.tab","#{builtSoftwareDirectoryPath(false)}/#{Ism.settings.rootPath}/usr/share/zoneinfo/zone.tab")
        copyFile("#{mainWorkDirectoryPath(false)}/zone1970.tab","#{builtSoftwareDirectoryPath(false)}/#{Ism.settings.rootPath}/usr/share/zoneinfo/zone1970.tab")
        copyFile("#{mainWorkDirectoryPath(false)}/iso3166.tab","#{builtSoftwareDirectoryPath(false)}/#{Ism.settings.rootPath}/usr/share/zoneinfo/iso3166.tab")

        runZicCommand(["-d","/usr/share/zoneinfo","-p","America/New_York"], mainWorkDirectoryPath)
    end

end
