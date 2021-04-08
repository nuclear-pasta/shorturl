# frozen_string_literal: true

require 'rails_helper'

describe ShortUrlsController, type: :controller do
  before do
    @user = create :user
    @short_url = create :short_url, user: @user, slug: 'example'
  end
  it 'gets redirected to the correct url' do
    get(:show, params: { slug: 'example' })
    response.status.should be(302)
    response.should redirect_to 'https://guides.rubyonrails.org/'
  end
  it 'user gets redirected if not authenticated when visiting action: new' do
    get :new
    response.status.should be(302)
  end
  it 'user gets redirected if not authenticated when visiting action: index' do
    get :index
    response.status.should be(302)
  end
  it 'user can access page if logged in when visiting action: new' do
    sign_in @user
    get :new
    response.status.should be(200)
  end
  it 'user can access page if logged in when visiting action: index' do
    sign_in @user
    get :index
    response.status.should be(200)
  end
  it 'increases the number of visits when the user uses the short url' do
    sign_in @user
    get :show, params: { slug: @short_url.slug }
    expect(@short_url.visits.count).to eq(1)
  end
end