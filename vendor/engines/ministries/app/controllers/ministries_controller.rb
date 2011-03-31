class MinistriesController < ApplicationController

  before_filter :find_all_ministries
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @ministry in the line below:
    present(@page)
  end

  def show
    @ministry = Ministry.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @ministry in the line below:
    present(@page)
  end

protected

  def find_all_ministries
    @ministries = Ministry.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/ministries").first
  end

end
