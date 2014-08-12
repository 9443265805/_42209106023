class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :quizname
      t.time :starttime
      t.time :endtime
      t.date :date
      t.string :category
      
      t.timestamps
    end
  end
end
