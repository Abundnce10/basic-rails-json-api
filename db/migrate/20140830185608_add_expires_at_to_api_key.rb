class AddExpiresAtToApiKey < ActiveRecord::Migration
  def change
    add_column :api_keys, :expires_at, :datetime
    add_reference :api_keys, :role, index: true
  end
end
