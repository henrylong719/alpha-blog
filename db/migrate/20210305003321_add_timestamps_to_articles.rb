class AddTimestampsToArticles < ActiveRecord::Migration[6.1]
  def change
    # add two methods
    
    #add_column :first argument :second argument :third argument
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
