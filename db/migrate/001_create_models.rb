class CreateModels < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
    end

    create_table :movies do |t|
      t.string :pic_url
      t.string :name
      t.integer :year
      t.string :description
    end

    create_table :ratings do |t|
      t.integer :star
      t.string :review
      t.integer :user_id
      t.integer :movie_id
    end
  end
end
