class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.belongs_to :question, null: false
      t.belongs_to :category, null: false
      t.timestamps
    end
  end
end
