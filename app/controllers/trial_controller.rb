class TrialController < ApplicationController
  def create()
    friend1=params[:friend1]
    friend2=params[:friend2]
    trial=Trial.find(session[:trial_id])
    @chars=trial.chars()
    @friend1=trial.friend1
#    @friend2=trial.friend2
    res1=trial.check(friend1)
#    res2=trial.check(friend2)

 #   if res1+res2==0
  #    @success1=false
  #    @success2=false
      #Got neither
 #   elsif res1+res2==3
 #     @success1=true
 #     @success2=true
      #Successfully got both of them
 #   elsif (res1==1 || res2==1)
 #     @success1=true
 #     @success2=false
     #Got first only
 #   elsif (res1==2 || res2==2)
 #     @success1=false
 #     @success2=true
     #Got second only
  #  end
@success1 = (res1 == 1)
  #current_user.post(@friend1,@friend2,@success1,@success2)
  end
end
