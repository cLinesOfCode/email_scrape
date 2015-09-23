class AddSentToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :sent, :boolean
  end
end
