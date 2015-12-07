module Selenium
  module WebDriver
    module SearchContext

      # You can also do driver.find_element :jquery, "a:contains('Hello World')" 
      # and boatload of jquery selectors.
      def find_element(*args)
        how, what = extract_args(args)

        if    how == :jquery &&  ref.nil?
          bridge.executeScript("return jQuery(arguments[0]).get(0);", what)
        elsif how == :jquery && !ref.nil?
          bridge.executeScript("return jQuery(arguments[0]).find(arguments[1]).get(0);",self, what)
        else
          unless by = FINDERS[how.to_sym]
            raise ArgumentError, "cannot find element by #{how.inspect}"
          end

          bridge.find_element_by by, what.to_s, ref
        end
      end

      # Same as find_elements. Now we can perform similar expressions like this:
      # 
      # driver.find_elements :jquery, ":header"
      def find_elements(*args)
        how, what = extract_args(args)

        if    how == :jquery &&  ref.nil?
          bridge.executeScript("return jQuery(arguments[0]).get();", what)
        elsif how == :jquery && !ref.nil?
          bridge.executeScript("return jQuery(arguments[0]).find(arguments[1]).get();",self, what)
        else
          unless by = FINDERS[how.to_sym]
            raise ArgumentError, "cannot find elements by #{how.inspect}"
          end

          bridge.find_elements_by by, what.to_s, ref
        end
      end


    end

  end
end