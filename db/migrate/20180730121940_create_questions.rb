class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :content
      t.boolean :private
      t.references :user, foreign_key: true
      t.integer :answers_count, default: 0, null: false

      t.timestamps
    end
  end
end
