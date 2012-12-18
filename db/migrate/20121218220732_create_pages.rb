class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.integer :sort_order, default: 1

      t.timestamps
    end
  end
end
