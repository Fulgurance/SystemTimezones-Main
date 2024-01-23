class Target < ISM::VirtualSoftware

    def install
        super

        if option("Britain")
            runLocaledefCommand(["-i","en_GB","-f","UTF-8","en_GB.UTF-8"])
        end

        if option("USA")
            runLocaledefCommand(["-i","en_US","-f","UTF-8","en_US.UTF-8"])
        end
    end

    def uninstall
        super

    end

end
