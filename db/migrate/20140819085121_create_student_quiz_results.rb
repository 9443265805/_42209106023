class CreateStudentQuizResults < ActiveRecord::Migration
  def change
    create_table :student_quiz_results do |t|
 		t.integer :score
      t.belongs_to :quiz
      t.belongs_to :user
      t.timestamps
    end
  end
end
