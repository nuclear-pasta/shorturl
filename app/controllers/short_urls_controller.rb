class ShortUrlsController < ApplicationController

    def show
      @link = ShortUrl.find_by_slug(params[:slug])
      render 'errors/404', status: 404 if @link.nil?
      @link.visits +=1
      @link.save
      redirect_to @link.original_url
    end

end