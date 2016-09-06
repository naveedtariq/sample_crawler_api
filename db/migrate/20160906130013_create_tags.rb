class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string  :name
      t.string  :text
      t.string  :url
      t.integer :url_request_id
      t.timestamps null: false
    end
  end
end
