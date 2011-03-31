module Admin
  class TrainingsController < Admin::BaseController

    crudify :training,
            :title_attribute => 'focus', :xhr_paging => true

  end
end
