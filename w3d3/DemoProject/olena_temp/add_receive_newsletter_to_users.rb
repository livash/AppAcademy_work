class AddReceiveNewslettertousers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.boolean :receive_newsletter, :default => false
    end
    User.each do |user|
      user.receive_newsletter = true
      user.save!
    end
  end
  
  def down
    remove_column :users, :receive_newsletter    
  end
end