class FacebookController < ApplicationController
  def create
    current_user = Facebook.createFacebook(params['code'])
    session[:current_user_id]=current_user.id
    redirect_to '/'
  end
  def login
    @oauth = Koala::Facebook::OAuth.new('119452241458412','2437e9d4a28701c924cb9dd6ccaa21b3','http://localhost:3000/facebook/create');
    redirect_to @oauth.url_for_oauth_code(:permissions => "publish_stream")
  end
end
