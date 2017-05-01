class AddAttachmentToFeedbacks < ActiveRecord::Migration[5.0]
   def self.up
    add_attachment :feedbacks, :attachment
  end

  def self.down
    remove_attachment :feedbacks, :attachment
  end
end
