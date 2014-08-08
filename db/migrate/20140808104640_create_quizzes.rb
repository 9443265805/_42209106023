class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :quizname
      t.time :duration
      
      t.timestamps
    end
  end
end
