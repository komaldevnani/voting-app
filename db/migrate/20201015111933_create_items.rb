class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.belongs_to :poll, foreign_key: true
    end
  end
end
