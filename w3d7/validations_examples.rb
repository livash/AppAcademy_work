#confirmation
class Person < ActiveRecord::Base
  validates :email, :confirmation => true
  validates :email_confirmation, :presence => true
end

# #in the webpage code we'll have
# <%= text_field :person, :email %>
# <%= text_field :person, :email_confirmation %>

#validates_associated
class Library < ActiveRecord::Base
  has_many :books
  validates_associated :books
end

class Book < ActiveRecord::Base
  belong_to :library
  validates :title, :publisher, :authors, :presence => true
end

#acceptance
class Person < ActiveRecord::Base
  validates :terms_of_service, :acceptance => true
end

#or if validation happens with user typing in a string 
class Person < ActiveRecord::Base
  validates :terms_of_service, :acceptance => { :accept => 'yes' }
end

#exclusion
class Account <ActiveRecord::Base
  validates :subdomain, :exclusion => { :in => %w(www us ca jp),
  :message => 'Subdomain %{value} is reserved' }
end

#format
class Product <ActiveRecord::Base
  validates :legacy_code, :format => { :with => /\A[a-zA-Z]+\z/,
  :message => "Only letters allowed" }
end

#inclusion
class Coffee < ActiveRecord::Base
  validates :size, :inclusion => { :in => %w(small medium large),
  :message => "%{value} is not a valid size" }  
end

#length
class Person < ActiveRecors::Base
  validates :name, :length => { :minimum => 2 }
  validates :bio, :length => { :maximum => 500 }
  validates :password, :length => { :in => 6..20 }
  validates :registration_number, :length => { :is => 6 }
end

#numericality
class Player < ActiveRecord::Base
  validates :points, :numericality => true
  validates :games_played, :numericality => {  :only_integer => true }
end

#presence
class Person < ActiveRecord::Base
  validates :name, :login, :email, :presence => true
end

class LineItem < ActiveRecord::Base
  belongs_to :order
  validates :order_id, :presence => true
end

#uniqueness
class Account < ActiveRecord::Base
  validates :email, :uniqueness => true
end

class Person < ActiveRecord::Base
  validates :name, :uniqueness => { :case_sensitive => false }
end

#validates_with
class Person < ActiveRecord::Base
  validates_with GoodnessValidator
end

class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if record.first_name == "Evil"
      record.errors[:base] << "This person is evil"
      #record.errors[:base] relates to the state of the record as a whole, and not a specific attribute
    end
  end
end

class Person < ActiveRecord::Base
  validates_with GoodnessValidator,
  :fields => [:first_name, :last_name] 
end

class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if options[:fields].any? do |field|
      record.sed(field) == "Evil"
    end
    record.errors[:base] << "This person is evil"
  end
end
end

#validates_each
class Person < ActiveRecord::Base
  validates_each :name, :surname do |record, attr, value|
    record.errors.add(attr, 'must start with uppper case') if value =~ /\A[a-z]/
  end
end

#allow_nil
class Coffee < ActiveRecord::Base
  validates :size, :inclusion => { :in => %w(small medium large) },
  :allow_nil => true
end

#allow_blank
class Topic < ActiveRecord::Base
  validates :title, :length => { :is => 5 }, :allow_blank => true
end

Topic.create(:title => '').valid? #->>> true
Topic.create(:title => nil).valid? #->>> true

#on
class Person < ActiveRecord::Base
  #it will be possible to update email with a duplicated value
  validates :email, :uniqueness => true, :on => :create
  
  #it will be possible to create a record with non-numeric value
  validates :age, :numericality => true, :on => :update
  
  # the default validates on both create and update
  validates :name, :presence => true, :on => :save
end


#CONDITIONAL VALIDATION
class Order < ActiveRecord::Base
  validates :card_number, :presence => true, :if => :paid_with_card?
  
  def paid_with_card?
    payment_type == "card"
  end
end

#GROUP CONDITIONAL VALIDATIONS
class User < ActiveRecord::Base
  with_options :if => :is_admin? do |admin|
    admin.validates :password, :length => { :minimum => 10 }
    admin.validates :email, :presence => true
  end
end



Spaceman.first.visited_planets

class Spaceman
  has_many :visited_planets throuhg: :planet_visits, source: :planet
end









