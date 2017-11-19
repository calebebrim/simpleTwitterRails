class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.references :user, foreign_key: true, index:true
      t.text :text
      t.timestamps
    end
    add_foreign_key :tweets, :users
  end
end
