class AddDetailsToItems < ActiveRecord::Migration
  def change
    add_column :items, :subject, :string
  end
end
