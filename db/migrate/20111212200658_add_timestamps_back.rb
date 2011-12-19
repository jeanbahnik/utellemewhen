class AddTimestampsBack < ActiveRecord::Migration
  def up
      add_column "questions", :created_at, :timestamp
      add_column "questions", :updated_at, :timestamp
      add_column "answers", :created_at, :timestamp
      add_column "answers", :updated_at, :timestamp
      add_column "users", :created_at, :timestamp
      add_column "users", :updated_at, :timestamp
      add_column "event_dates", :created_at, :timestamp
      add_column "event_dates", :updated_at, :timestamp
      add_column "user_questions", :created_at, :timestamp
      add_column "user_questions", :updated_at, :timestamp
  end

  def down
  end
end
