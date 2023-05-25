class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :books do |t|
      t.string :title, null: false
      t.belongs_to :user, null: true, foreign_key: true
      t.timestamps
    end
  end
end
