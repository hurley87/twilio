class AddDelayedJobsIdToUdpates < ActiveRecord::Migration
  def change
  	add_column :updates, :delayed_jobs_id, :integer
  end
end
