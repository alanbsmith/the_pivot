class AddOrderIdToResumeTable < ActiveRecord::Migration
  def change
    create_table   "resumes", force: true do |t|
      t.integer    "user_id"
      t.integer    "order_id"
      t.string     "attachment"
      t.datetime   "created_at"
      t.datetime   "updated_at"
    end
  end
end
