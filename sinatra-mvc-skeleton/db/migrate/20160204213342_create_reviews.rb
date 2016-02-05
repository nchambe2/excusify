class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string   :rating
      t.integer  :reviewer_id
      t.integer  :excuse_id
      t.timestamps(null: false)
    end
  end
end
