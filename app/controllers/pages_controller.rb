class PagesController < ApplicationController
  include HighVoltage::StaticPage
  layout :layout_for_page

  private

  def layout_for_page
    id = params[:id]

    return :home if id === 'home'
    return false if id === 'willitflood'

    :application
  end
end