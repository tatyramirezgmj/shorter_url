class AddShortLinkToLink < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :short_link, :string
  end
end
