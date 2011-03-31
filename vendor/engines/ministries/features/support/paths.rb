module NavigationHelpers
  module Refinery
    module Ministries
      def path_to(page_name)
        case page_name
        when /the list of ministries/
          admin_ministries_path

         when /the new ministry form/
          new_admin_ministry_path
        else
          nil
        end
      end
    end
  end
end
