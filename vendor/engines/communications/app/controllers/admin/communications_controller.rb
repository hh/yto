module Admin
  class CommunicationsController < Admin::BaseController

    crudify :communication, :xhr_paging => true

  end
end
