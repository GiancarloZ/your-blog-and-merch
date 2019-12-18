class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :user_comment
      t.belongs_to :user
      t.belongs_to :post
      t.timestamps
    end
  end
end
