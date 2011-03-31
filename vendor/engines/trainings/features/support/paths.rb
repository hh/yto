module NavigationHelpers
  module Refinery
    module Trainings
      def path_to(page_name)
        case page_name
        when /the list of trainings/
          admin_trainings_path

         when /the new training form/
          new_admin_training_path
        else
          nil
        end
      end
    end
  end
end
