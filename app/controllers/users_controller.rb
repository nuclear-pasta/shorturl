class UsersController < ApplicationController
    before_action :authenticate_user

    def show
      @link = ShortUrl.find_by(slug: params[:slug])
      @link.visits +=1
      @link.save
      redirect_to @link.original_url
    end

end