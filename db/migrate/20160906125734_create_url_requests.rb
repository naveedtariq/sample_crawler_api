class CreateUrlRequests < ActiveRecord::Migration
  def change
    create_table :url_requests do |t|
      t.string :url

      t.timestamps null: false
    end
  end
end
