class AddTopicIdToTerms < ActiveRecord::Migration
  def change
    add_column :terms, :topic_id, :integer
  end
  
  def down
    remove_column :terms, :topic_id
  end
end
