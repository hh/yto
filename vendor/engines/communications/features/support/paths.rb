module NavigationHelpers
  module Refinery
    module Communications
      def path_to(page_name)
        case page_name
        when /the list of communications/
          admin_communications_path

         when /the new communication form/
          new_admin_communication_path
        else
          nil
        end
      end
    end
  end
end
