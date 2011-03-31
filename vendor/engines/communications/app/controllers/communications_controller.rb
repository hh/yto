class CommunicationsController < ApplicationController

  before_filter :find_all_communications
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @communication in the line below:
    present(@page)
  end

  def show
    @communication = Communication.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @communication in the line below:
    present(@page)
  end

protected

  def find_all_communications
    @communications = Communication.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/communications").first
  end

end
