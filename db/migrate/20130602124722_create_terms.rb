class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :question
      t.string :answer
      t.string :uuid

      t.timestamps
    end
  end
end
