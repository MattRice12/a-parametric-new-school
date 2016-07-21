# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


school_name = ["Austin", "Highland", "Canyon", "Forest", "Canyon", "Nederland", "Bryan", "Dallas", "Houston", "Port Arthur", "Galveston", "San Antonio", "New York", "China", "Bjfasf", "Dane", "Justin", "Matt", "Rob", "Kate", "Ahkeem", "Anything-else", "Somewhere", "Pool", "Washington", "Jackson", "Adams", "Clinton", "Bush"]
first_name = ["Jack", "Jane", "Jill", "Anthony", "Audrey", "Samantha", "Caroline", "Janet", "Marissa", "Jaime", "Amber", "Lauren", "Laura", "Lindsey", "Salvador"]
last_name = ["Smith", "Jackson", "Thompson", "Johnson", "Miller", "Decker", "Turner", "Wilson", "Crawford", "Phillips", "Garson", "Black", "White", "Orange", "Yellow"]

4.times do
  school = School.create!(name: "#{school_name.sample} HighSchool")

  3.times do
    teacher = Teacher.create!(name: "#{first_name.sample} #{last_name.sample}", school_id: school.id)

    10.times do
      Student.create!(name: "#{first_name.sample} #{last_name.sample}", teacher_id: teacher.id)
    end
  end
end
