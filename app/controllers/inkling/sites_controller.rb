class Inkling::SitesController < ApplicationController

  before_filter :get_site, :except => [:index, :new]

  def index
    @sites = Site.all
  end

  def show    
  end

  private
  def get_site
    @site = Site.find(params[:id])
  end
end