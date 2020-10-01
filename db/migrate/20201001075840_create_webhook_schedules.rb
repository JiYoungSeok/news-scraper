class CreateWebhookSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :webhook_schedules do |t|
      t.string :webhook_url
      t.time :time
      
      t.timestamps
    end
  end
end
