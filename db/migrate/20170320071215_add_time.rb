class AddTime < ActiveRecord::Migration[5.0]
  def change
  	add_column :ratings, :created_at, :datetime
  	add_column :ratings, :updated_at, :datetime
  end
end
