class InitialIndices < ActiveRecord::Migration
  def up
    add_index "event_dates", "event_id"
    add_index "answers", ["event_id", "question_id"], :unique => true
    add_index "user_questions", ["question_id", "user_id"], :unique => true
  end

  def down
  end
end
