class HomeController < ApplicationController
  def index()
    if current_user == nil
      redirect_to '/facebook/login'
   else
      @friends= current_user.facebook_friends.count
      if @friends >= 2 then
        @friend1 = current_user.randomFriend()
        begin
        @friend2 = current_user.randomFriend()
        end while @friend2 == @friend1
        trial=Trial.new(:friend1_id=> @friend1.id,:friend2_id => @friend2.id,:facebook_id => current_user.id)
        trial.save()
        session[:trial_id] = trial.id
        @chars = trial.chars()
      end
    end
  end
end
