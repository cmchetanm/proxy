class CreatePings < ActiveRecord::Migration[5.2]
  def change
    create_table :pings do |t|
      t.text :original_url
      t.string :ping_type
      t.string :app_id
      t.json :query_params
      t.json :ping_errors
      t.timestamps
    end
  end
end
