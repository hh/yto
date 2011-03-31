module Admin
  class MinistriesController < Admin::BaseController

    crudify :ministry, :xhr_paging => true

  end
end
