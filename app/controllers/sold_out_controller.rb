class SoldOutController < ApplicationController

  def index
    @genre_list = [["hoge", 1], ["fuga", 2], ["piyo", 3]]
  end
  
  def show
    puts "HOGEEEEEEEEEEEEEEEEEEEEEEEEE"
  end

end
