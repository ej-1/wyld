class AddSponsorAndStreamerToUserQuestions < ActiveRecord::Migration
  def change
    add_column :users, :viewer_base_description, :string
    add_column :users, :channel_adress, :string

    add_column :users, :company_url, :string
    add_column :users, :product_or_service_industry, :string
    add_column :users, :customer_description, :text

  end
end
