class Recipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :name
      t.string :email
      t.string :category
      t.string :cold_email_sent

      t.timestamps null: false
    end
  end
end
