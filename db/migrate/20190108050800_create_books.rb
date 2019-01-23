class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|

      t.timestamps
      t.string :title
      t.string :category
      t.string :body
    end
  end
end
