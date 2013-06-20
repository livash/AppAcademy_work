#Question 4
class User
  has_many :my_teams,
  :class_name => "Teams",
  through: :memberships, source: :team
  
  has_many :memberships
  
end

class Memebership
  belongs_to :team, 
  :class_name => "Teams"
  
  belongs_to :user
end

class Teams
  has_many :memberships
  
  has_many :players,
  :class_name => "User",
  though: :memberships, source: :user
  
end

User.first.my_teams

Membership.first.team

Membership.first.user

Team.first.players

Team.first.player_ids


#Question 5
class User
  has_many :posts
end

class Post
  belongs_to :user
end

Posts.all == 5

u = User.create(name: 'Jim')
u.id == 2
u.post_ids = [3,4,5]

#Question 6
u2 = User.first
u2.post_ids = [5] # this statement would delete all rows with user_id == 1 in the posts table. Dangerous.

Post.find(5).user = User.first

#Question 7
class Team
  has_many :memberships
  has_many :users, through: :memberships
end

class Memberships
  belongs_to :team
  belongs_to :user
end

class User
  has_many :teams, through: :memberships, source: :team
  has_many :memberships
end

#Question 8

class User
  has_many :posts
end

class Post
  belongs_to :user

  validates :user_id, presence: true
end

u = User.new(name: 'Jim')
u.posts.build(title: 'My first post')
u.save











