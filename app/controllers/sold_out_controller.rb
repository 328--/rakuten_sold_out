class SoldOutController < ApplicationController
  
  def index
    RakutenWebService.configuration do |c|
      c.application_id = ENV["APPID"]
      c.affiliate_id = ENV["AFID"]
    end
    root = RakutenWebService::Ichiba::Genre.root # root genre
    @genres = root.children
  end

  def search
    @search_result = "HOGEEEEEEEEEEEEE"
  end

end
