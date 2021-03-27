class ShortUrlsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
    def show
      @link = ShortUrl.find_by(slug: params[:slug])
      @link.visits +=1
      @link.save
      redirect_to @link.original_url
    end

    def index
      @urls = current_user.short_urls
    end

end