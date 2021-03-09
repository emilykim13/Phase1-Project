# In this file you can create your initial instances of your classes
Arm.destroy_all
Ab.destroy_all
Leg.destroy_all
Back.destroy_all
Shoulder.destroy_all
User.destroy_all
UsersWorkout.destroy_all
Workout.destroy_all

barbell_bicep_curl = Arm.create(name: "Barbell Bicep Curl", intensity: "low", duration: 1.0)
russian_twists = Ab.create(name: "Russian Twists", intensity: "high", duration: 1.0)
lunges = Leg.create(name: "lunges", intensity: "low", duration: 1.0)
deadlifts = Back.create(name: "Deadlifts", intensity: "high", duration: 1.0)
pullups = Shoulder.create(name: "Pull-ups", intensity: "high", duration: 1.0)
emily = User.create(user_name: "emilykim13", password: "ilikememes", first_name: "emily", last_name: "nguyen", weight: 128, height: 67.0, gender: "female", BMI: 20.0, birth_year: 1997)
workout1 = Workout.create(name: "Emily Can't Lift", type: "HIIT", abs_id: abs.id, arms_id: arms.id, legs_id: legs.id, shoulders_id: shoulders.id, backs_id: backs.id)
UsersWorkout.create(name: workouts.name, users_id: users.id, workouts_id: workouts.id, total_duration: 10.0, favorites: nil, date: 03-02-2021)


# create_table :workouts do |t|
#     t.string :name
#     t.string :type
#     t.integer :abs_id
#     t.integer :arms_id
#     t.integer :legs_id
#     t.integer :shoulders_id
#     t.integer :back_id
# create_table :users_workouts do |t|
#     t.string :name
#     t.integer :users_id
#     t.integer :workouts_id
#     t.integer :total_duration
#     t.string :favorites
#     t.integer :date
#   end