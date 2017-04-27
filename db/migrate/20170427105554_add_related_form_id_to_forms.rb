class AddRelatedFormIdToForms < ActiveRecord::Migration
  def change
    add_column :forms, :related_form_id, :integer
  end
end
