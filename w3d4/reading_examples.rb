class Comment < ActiveRecord::Base
  [ :body,
    :author_id,
    :post_id,
    :parent_comment_id ].each { |field| attr_accessible field }
    
  [ :body,
    :author_id,
    :post_id ].each { |field| validates field, :presence => true }
  
    belongs_to :author, :class_name => "User"
    belongs_to :post
    belongs_to :parent, :class_name => "Comment", :foreing_key => "parent_comment_id"
    has_many :replies, :class_name = "Comment", :foreign_key => "parent_comment_id"
  
  def self.reply_to_post(post, user, body)
    Comment.create!(
    :body => body,
    :author_id => user.id,
    :post_id => post.id,
    :parent_comment_id => nil)
  end

  def self.reply_to_comment(comment, user, body)
    Comment.create!(
    :body => body,
    :author_id => user.id,
    :post_id => comment.post_id,
    :parent_comment_id => comment.id)
  end
end
 
class User < ActiveRecord::Base
  [ :user_name,
    :first_name,
    :last_name ].each do |field|
      attr_accessible field
      validates field, :presence => true
    end

  has_many :posts, :foreign_key => :author_id
  has_many :comments, :foreign_key => :author_id
  has_many :post_feedbacks, :through => :posts, :source => :comments

  def n_plus_one_comment_counts
    posts = self.posts
    post_comment_counts = {}
    posts.each do |post|
      post_comment_counts[post] = post.comments.count
    end

    post_comment_counts
  end

  def includes_post_comments_counts
    posts = self.posts.includes(:comments)
    post_comment_counts = {}
    posts.each do |post|
      post_comment_counts[post] = post.comments.length
    end

    post_comment_counts
  end

  def self.users_with_comments
    User.joins(:comments)
  end

  def joins_post_comment_counts
    posts_with_counts = self
    .posts
    .select("posts.*, COUNT(*) AS comments_count")
    .joins(:comments)
    .group("posts.id")

    posts_with_counts.map do |post|
      [post.title, post.comments_count]
    end
  end
end

class Post << ActiveRecord::Base
  [ :title,
    :body,
    :author_id ].each do |field|
      attr_accessible field
      validates field, :presence => true
  end
  
  belongs_to :author, :class_name => "User"
  has_many :comments, :foreign_key => :post_id  
end


