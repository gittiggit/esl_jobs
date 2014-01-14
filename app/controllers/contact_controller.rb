class ContactController < ApplicationController
  def index
    @countries= Country.all
  end
end
