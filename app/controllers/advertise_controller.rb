class AdvertiseController < ApplicationController
 def index
     @countries= Country.all
  end
end
