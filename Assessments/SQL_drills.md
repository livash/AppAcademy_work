# Drills

## Question 1.
For **each** of the associations in the following scenarios, specify the **:class_name, :primary_key, and :foreign_key** that would be generated **by default**. For the :primary_key and :foreign_key, please specify **which table** Rails will look for them in.

#### Scenario 1
```
class User
  has_many :posts, :primary_key => "users.id", :foreign-key => "posts.user_id", :class_name => "Post"
end
```



#### Scenario 2
```
class User
  has_many :posts, :primary_key => "users.id", :foreign_key => "posts.user_id", :class_name => "Post"
end

class Post
  belongs_to :user, :primary_key => "users.id", :foreign_key => "posts.user_id", :class_name => "User"
end
```

#### Scenario 3
```
class User
  has_many :writings, :primary_key => "user.id", :foreign_key => "posts.user_id", :class_name => "Post"
end

class Post
  belongs_to :author, :primary_key => "users.id", foreign_key => "posts.user_id", 
  :class_name => "User"
end
```

#### Scenario 4
```
class Spaceman
  has_many :minions, primary_key => "spacemen.id", :foreign_key => "minions.spaceman_id", :class_name => "Minion"
  has_many :planet_visits, :primary_key => "spacemen.id", :foreign_key => "planet_visits.spaceman_id", :class_name => "PlanetVisit"
  has_one :spaceship, :primary_key => "spacemen.id", :foreign_key => "spaceships.spaceman_id", :class_name => "Spaceship"
  belongs_to :race, :primary_key => "races.id", foreign_key => "spacemen.race_id", :class_name => "Race"
end
```

#### Scenario 5
```
 # Building on Scenario 4

class Minion
  belongs_to :overlord, :primary_key => "spacemen.id", :foreign_key => "minions.overlord_id", :class_name => "Spaceman"
end

class Visit
  belongs_to :visitor, :primary_key => "spacemen.id", :foreing_key => "visits.visitor_id", :class_name => "Spaceman"
  belongs_to :planet, :primary_key => "planets.id", :foreign_key => "visits.panet_id", :class_name => "Planet"
end

class Spaceship
  belongs_to :owner, :primary_key => "spacemen.id", :foreign_key => "spaceships.owner_id", class_name => "Spaceman"
end

class Race
  has_many :people, :primary_key => "races.id", :foreign_key => "spacemen.race_id", :class_name => "Spaceman"
end

class Planet
has_many :visits, :primary_key => "planets.id", :foreign_key => "visits.planet_id", :class_name => "Visit"
end

```


## Question 2.

Scenarios 3, 4, and 5 will not work as written. Please fix them so they work. **Do not change the name of any of the associations or write any new ones.** Use the options we've learned to make them work.

**Scenario 3**

* For the `has_many`, I want `Post` objects back 
* For the `belongs_to`, I want a `User` back

#### Scenario 3
```
class User
  has_many :writings, :primary_key => "user.id", :foreign_key => "posts.user_id", :class_name => "Post"
end

class Post
  belongs_to :author, :primary_key => "users.id", foreign_key => "posts.user_id", 
  :class_name => "User"
end
```

**Scenarios 4 & 5**

* On `Spaceman`:
	* For `planet_visits`, I want `Visit` objects back
* On `Minion` & `Visit` & `Spaceship` & `Race`:
	* For `overlord`/`visitor`/`owner`/`people`, I want `Spaceman` objects back

	#### Scenario 4
	```
	class Spaceman
	  has_many :minions, primary_key => "spacemen.id", :foreign_key => "minions.spaceman_id", :class_name => "Minion"
	  has_many :planet_visits, :primary_key => "spacemen.id", :foreign_key => "visits.spaceman_id", :class_name => "Visit"
	  has_one :spaceship, :primary_key => "spacemen.id", :foreign_key => "spaceships.spaceman_id", :class_name => "Spaceship"
	  belongs_to :race, :primary_key => "races.id", foreign_key => "spacemen.race_id", :class_name => "Race"
	end
	```
	#### Scenario 5
	```
	 # Building on Scenario 4

	class Minion
	  belongs_to :overlord, :primary_key => "spacemen.id", :foreign_key => "minions.overlord_id", :class_name => "Spaceman"
	end

	class Visit
	  belongs_to :visitor, :primary_key => "spacemen.id", :foreing_key => "visits.visitor_id", :class_name => "Spaceman"
	  belongs_to :planet, :primary_key => "planets.id", :foreign_key => "visits.panet_id", :class_name => "Planet"
	end

	class Spaceship
	  belongs_to :owner, :primary_key => "spacemen.id", :foreign_key => "spaceships.owner_id", class_name => "Spaceman"
	end

	class Race
	  has_many :people, :primary_key => "races.id", :foreign_key => "spacemen.race_id", :class_name => "Spaceman"
	end

	class Planet
	has_many :visits, :primary_key => "planets.id", :foreign_key => "visits.planet_id", :class_name => "Visit"
	end

	```

## Question 3.

For Scenarios 4 & 5 above, please write **a single association** so that I can call `Spaceman.first.visited_planets` and get an array of `Planet` objects back.

class Spaceman
has_many :visited_panets, :class_name => "Planet", :through => :visits, :source =>:visits

has_many :visits, :primary_key => "spacemen.id", :foreign_key => "visits.spaceman_id", :class_name => "Visit"
end

class Planet
has_many :visits, :primary_key => "planets.id", :foreign_key => "visits.planet_id", :class_name => "Visit"
end

class Visit
belongs_to :planet, :primary_key => "planets.id", :foreign_key => "visits.planet_id", :class_name => "Planet"
end

## Question 4.

```
class User
has_many :my_teams, :class_name => "Team" :through => :memberships, :source => :team
has_many :memberships
end

class Membership
belongs_to :user
belongs_to :team
end

class Team
has_many :players, :class_name => "User", :through => :memberships, :source => :user
has_many :memberships
has_many :player_ids, ??????????????
end
```

Please write the necessary associations on the above models so that I can call the following methods:

*       `User.first.my_teams`
*        `Membership.first.team`
*        `Membership.first.user`
* 	   `Team.first.players`
* `Team.first.player_ids` ???????????????????????


## Question 5.

```
class User
  has_many :posts
end

class Post
  belongs_to :user
end
```

There are 5 posts (with id's 1-5). All belong to the first User (user with id 1). 

I then run:

```
u = User.create(name: 'Jim')  # <= This user's id is 2
u.post_ids = [3, 4, 5]
```

1. Have any attributes changed?
2. If any attributes have changed, which attributes exactly?
3. Have any changes been persisted to the database?

## Question 6.

Oops. I didn't mean to assign the post with `id` 5 to the second user. Set the user of that post back to the first user. Do not use `update_attributes` or the like.


## Question 7.

```
class Team
  has_many :memberships
  has_many :users, through: :memberships
end

class Memberships
  belongs_to :team
  belongs_to :user
end

class User
  has_many :teams
end
```

This code is broken. Please fix it so that I can call `User.first.team_ids = [3, 4, 5]`.

Now that it's fixed, I call `User.first.team_ids = [3, 4, 5]`.

1. Has anything been changed in the database?
2. If anything, what exactly has changed in the database?


## Question 8.

```
class User
  has_many :posts
end

class Post
  belongs_to :user
  
  validates :user_id, presence: true
end
```

I call: 

```
u = User.new(name: 'Jim')
u.posts.build(title: 'My first post')
u.save
```
But it doesn't work. Please fix it.

## Question 9.

For each of the following scenarios, please write out the params that would be generated.

#### Scenario 1
```
<input name='user[name]' value='Jim'></input>
<input name='user[password]' value='****'></input>
<input name='user[address][street]' value='1234 Cherry Lane'></input>
<input name='user[address][city]' value='San Francisco'></input>
<input name='user[address][state]' value='CA'></input>
```

#### Scenario 2
```
<input name='user[name]' value='Jim'></input>
<input name='user[name][supername]' value='Superman'></input>
<input name='post[body]' value='Hi'></input>
<input name='comment[title]' value='Bye'></input>
<input name='user[name]' value='Bob'></input>
```

#### Scenario 3
```
<input name='bob[patient_ids]' value='1'></input>
<input name='bob[patient_ids]' value='2'></input>
<input name='bob[patient_ids]' value='3'></input>
<input name='bob[patient_ids]' value='4'></input>
<input name='bob[patient_ids]' value='5'></input>
```

#### Scenario 4
```
<input name='bill[neverland][]' value='1'></input>
<input name='bill[neverland][]' value='2'></input>
<input name='bill[neverland][]' value='3'></input>
<input name='user_attributes[name]' value='Lalala'></input>
<input name='user_attributes[age]' value='5'></input>
```

#### Scenario 5
```
<input name='boom' value='1'></input>
<input name='aqualung[artist]' value='Jethro Tull'></input>
<input name='am_I_real' value='3'></input>
<input name='yes[no][actually_yes]' value='4'></input>
<input name='yes[no]' value='5'></input>
```

## Question 10.

Please write the correct `form` tag that will get me the desired results for each scenario.

1. post to 'http://www.google.com'
2. get to '/i-have-someting-to-show-you'
3. post to '/users'
4. post to 'http://blahblah.com'
5. get to '/tolstoy-went-soft'

## Question 11.

Here is an `erb` form:

```
<%= form_for @user, url: '/people' do |f| %>
  <%= f.label :name, 'My Very Special Name' %>
  <%= f.text_field :name, class: 'super-name' %>
  <%= f.text_field :email %>
  <%= f.fields_for :posts do |post_f| %>
    <%= post_f.label :body %>
    <%= post_f.text_area :body %>
    <%= post_f.label :title %>
    <%= post_f.text_field :title %>
  <% end %>
<% end %>
```

1. Write the HTML that it generates.
2. Write out how the params come in.


## Question 12.

Once the form in the previous question submits, it comes to the following action:

```
def create
  @user = User.create(params[:user])
end
```

Here is the model currently:

```
class User
  attr_accessible :name, :email
  
  has_many :posts
end
```

1. Does this work as is? Why or why not?
2. If not, fix it.

## Question 13.

A user `has_many :projects`. Please alter the form in Question 11 to display checkboxes for all the `Project`s so that the user may select which ones he wants to sign up for. 

1. Do the erb version.
2. Do the HTML version. 
3. Update how your params hash comes in.

## Question 14.

Now, let's say the controller action we have remains exactly the same. 

1. Will the controller action work as expected? Why or why not?
2. If not, what do you need to change for it to work (exact code you need)?