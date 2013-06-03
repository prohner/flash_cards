class AddSubjectIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :subject_id, :integer
  end
  
  def down
    remove_column :topics, :subject_id
  end
end
