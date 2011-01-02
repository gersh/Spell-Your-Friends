class Facebook < ActiveRecord::Base
  has_many :facebook_friends

  def self.createFacebook(code)
    oauth = Koala::Facebook::OAuth.new('119452241458412','2437e9d4a28701c924cb9dd6ccaa21b3','http://www.spellyourfriends.com/facebook/create');
    token = oauth.get_access_token_info(code)
    graph = Koala::Facebook::GraphAPI.new(token['access_token'])
    profile = graph.get_object("me")
    friends = graph.get_connections("me","friends")
    facebook = Facebook.new
    facebook.user_id = profile["id"]
    facebook.uid = profile["name"]
    facebook.token = token['access_token']
    friends.each do |f|
      facebook.facebook_friends.build(:friend => f['name'], :friend_id=> f['id'])
    end
    facebook.save()
    facebook
  end
  def randomFriend()
    self.facebook_friends.find(:first, :offset => rand(self.facebook_friends.count))
  end
  def post(friend1, friend2, success1, success2)
    graph = Koala::Facebook::GraphAPI.new(self.token)
    graph.put_wall_post(friend1,wallMsg("",friend1.friend,success1))
    graph.put_wall_post(friend2,wallMsg("",friend2.friend2,success2))

  end
    private
    def wallMsg(yourName, friendName,success)
      if(success)
        msg="#{friendName}, I successfully unscrambled your name on http://www.spellyourfriends.com"
      else
        msg="#{friendName}, I failed to unscramble your name on http://www.spellyourfriends.com"
      end
      {:message=>msg, :name=>"Spell Your Friends", :link=>"http://www.spellyourfriends.com"}
    end
end
