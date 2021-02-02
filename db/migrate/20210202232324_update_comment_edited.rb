class UpdateCommentEdited < ActiveRecord::Migration[6.1]
  def change
    change_column :comments, :edited, :boolean, null: false
    change_column_default :comments, :edited, false
  end
end
