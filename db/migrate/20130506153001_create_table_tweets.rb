class CreateTableTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :text
      t.references :user
      # t.timestamps
      t.date :tweeted_at
    end
  end
end
