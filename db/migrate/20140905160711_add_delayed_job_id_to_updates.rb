class AddDelayedJobIdToUpdates < ActiveRecord::Migration
  def change
  	add_column :updates, :delayed_job_id, :integer
  end
end
