class CreateShortUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :short_urls do |t|
      t.string :original_url
      t.string :slug
      t.integer :visits, default: 0
      t.references :user, type: :uuid
      t.timestamps
    end
  end
end
