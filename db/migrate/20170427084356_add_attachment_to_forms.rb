class AddAttachmentToForms < ActiveRecord::Migration
  def change
    add_attachment :forms, :attachment
  end
end
