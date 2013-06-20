resources :photos do
  member do
    post "upvote"
  end
  
  collection do
    get "most_popular"
  end
end

class User < ActiveRecord::Base
  attr_accessible :addresses_attributes
  
  has_many :addresses, :inverse_of => :addresses, :dependent_destroy => true
  
  accepts_nested_attributess_for :addreses,
                                 :reject_if => :all_blank,
                                 :allow_destroy => true
end

class Address <ActiveRecord::Base
  attr_accessible :street, :city, :user_id
  
  belongs_to :user, :inverse_of => :user
  
end

=begin
SessionsCOntroller => new create destroy
ApplicationCOntrollerHelper => current_user, verify_user
User => #issue_new_session_token!
User => :log_out!
User => password=()


=end