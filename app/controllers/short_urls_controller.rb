class ShortUrlsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
    def new
      @short_url = ShortUrl.new
    end

    def create
      @short_url = current_user.short_urls.new(required_param)
      @short_url.add_random_slug
      if @short_url.save
        redirect_to short_urls_path
      else
        redirect_to new_short_url_path, flash: { error: @short_url.errors.full_messages }
      end
    end

    def show
      link = ShortUrl.find_by(slug: params[:slug])
      return render '404.html.erb' if link.nil?
      link.visits.create()
      redirect_to link.original_url
    end

    def index
      @urls = current_user.short_urls
      # byebug
    end

    def required_param
      params.require(:short_url).permit(:description, :original_url)
    end

end