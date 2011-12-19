class Questions < ActiveRecord::Migration
  def up
    create_table "questions" do |t|
      t.string   "name"
      t.integer   "parent_id"
    end
    
    create_table "answers" do |t|
      t.integer   "event_id"
      t.integer   "question_id"
      
    end

    create_table "user_questions" do |t|
      t.integer   "question_id"
      t.integer   "user_id"
    end
  end

  def down
    drop_table "questions"
    drop_table "answers"
    drop_table "user_questions"
  end
end
