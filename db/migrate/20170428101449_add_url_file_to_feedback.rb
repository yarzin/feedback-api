class AddUrlFileToFeedback < ActiveRecord::Migration[5.0]
  def change
    add_column :feedbacks, :url_file, :string
    add_column :feedbacks, :name_file, :string
  end
end
