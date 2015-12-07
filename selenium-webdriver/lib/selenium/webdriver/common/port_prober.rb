# Handles creating selenium webdriver instances
module Selenium
  module WebDriver
    module PortProberExtensions

      # Prevent method from blowing up in case of "Access Denied"
      def self.free?(port)
        super
      rescue  Errno::EACCES
        false
      end
    end

    # Module#prepend is new technique in Ruby 2.0 to perform monkey patching 
    # on method of the same name while still retain reference to original 
    # method. Kind of like "extending its own class" in Java sense. 
    class PortProber
      prepend PortProberExtensions
    end
  end
end
