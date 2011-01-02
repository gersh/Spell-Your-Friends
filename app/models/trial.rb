class Trial < ActiveRecord::Base
  belongs_to :facebook
  belongs_to :friend1, :class_name => "FacebookFriend"
  belongs_to :friend2, :class_name => "FacebookFriend"


  def chars()
    (self.friend1.friend).downcase().scan(/[a-z]/).join().split(//).sort().join()
  end
  def check(str)
    if clean(self.friend1.friend)==clean(str) then
      1
    else
      0
    end
  end
private
  def clean(str)
    str.downcase().scan(/[a-z]/).join()
  end
end
