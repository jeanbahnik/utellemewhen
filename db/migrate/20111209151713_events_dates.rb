class EventsDates < ActiveRecord::Migration
  def up
    create_table "event_dates" do |t|
      t.string   "name"
      t.integer   "event_id"
      t.datetime   "date"
    end
  end

  def down
  end
end
