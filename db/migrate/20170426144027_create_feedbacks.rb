class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.integer :age
      t.text :name
      t.date :date
      t.string :id_last_request

      t.timestamps
    end
  end
end
