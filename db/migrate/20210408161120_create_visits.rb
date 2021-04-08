class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits, id: :uuid do |t|
      t.references :short_url, type: :uuid
      t.timestamps
    end
    remove_column :short_urls, :visits
  end
end
