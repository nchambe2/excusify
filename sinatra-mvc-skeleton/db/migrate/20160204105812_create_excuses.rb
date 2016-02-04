class CreateExcuses < ActiveRecord::Migration
  def change
    create_table :excuses do |t|
      t.string   :body
      t.integer  :creator_id
      t.timestamps(null: false)
    end
  end
end
