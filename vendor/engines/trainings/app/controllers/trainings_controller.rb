class TrainingsController < ApplicationController

  before_filter :find_all_trainings
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @training in the line below:
    present(@page)
  end

  def show
    @training = Training.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @training in the line below:
    present(@page)
  end

protected

  def find_all_trainings
    @trainings = Training.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/trainings").first
  end

end
