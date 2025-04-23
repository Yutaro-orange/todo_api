class CreateMemos < ActiveRecord::Migration[6.1]
  def change
    create_table :memos do |t|
      t.string :content
      t.references :category, index: true, foreign_key: true
      t.timestamps
    end
  end
end