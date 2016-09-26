class AddQuestionsToUser < ActiveRecord::Migration
  def change
    add_column :users, :company_name, :string
    add_column :users, :name, :string
    add_column :users, :facebook_followers, :integer
    add_column :users, :youtube_followers, :integer
    add_column :users, :pinterest_followers, :integer
    add_column :users, :instagram_followers, :integer
    add_column :users, :other_media_followers, :integer
    add_column :users, :country, :string
    add_column :users, :style, :string
    add_column :users, :gender_focus, :string
    add_column :users, :design_experience, :integer
    add_column :users, :total_offline_and_online_audience_marketing_cost, :string
  end
end
