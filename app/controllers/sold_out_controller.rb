require 'open-uri'
require 'json'

class SoldOutController < ApplicationController
  @@application_id = 0
  @@affiliate_id = 0

  def index
  @@application_id = ENV["SOLD_OUT_APPID"]
  @@affiliate_id = ENV["SOLD_OUT_AFID"]

    RakutenWebService.configuration do |c|
      c.application_id = @@application_id
      c.affiliate_id = @@affiliate_id
    end
    root = RakutenWebService::Ichiba::Genre.root # root genre
    @genres = root.children
  end

  def search

    item_search_url = "https://app.rakuten.co.jp/services/api/IchibaItem/Search/20140222"
    genreId = params[:selected_genre]
    max_page = 100 # Rakuten API's maximum number
    sort_style = "-updateTimestamp"
    page_num = 1
    hit_num = 30
    search_flag = true
    application_id = @@application_id
    while page_num <= max_page and search_flag
    
      begin
        response = open "#{item_search_url}?applicationId=#{application_id}&genreId=#{genreId}&page=#{page_num}&hits=#{hit_num}&availability=0&sort=#{sort_style}"
      rescue OpenURI::HTTPError => error
        error_status, error_message = error.io.status
        p "error : #{error_status} #{error_message}"
        break
      end

      @search_result = ActiveSupport::JSON.decode response.read
      max_page = @search_result['pageCount'].to_i
      @search_result['Items'].each do |item|
        if item['Item']['availability'] == 0
          search_flag = false
        end
      end
      page_num = page_num + 1
    end
  end
end
