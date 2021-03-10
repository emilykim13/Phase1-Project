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
workout1 = Workout.create(name: "Emily Can't Lift", workout_type: "HIIT", abs_id: russian_twists.id, arms_id: barbell_bicep_curl.id, legs_id: lunges.id, shoulders_id: pullups.id, backs_id: deadlifts.id)
workout2 = Workout.create(name: "Emily Can Lift", workout_type: "HIIT", abs_id: russian_twists.id, arms_id: barbell_bicep_curl.id, legs_id: lunges.id, shoulders_id: pullups.id, backs_id: deadlifts.id)

UsersWorkout.create(name: workout1.name, users_id: emily.id, workouts_id: workout1.id, total_duration: 10.0, favorites: nil, date: 03-02-2021)
UsersWorkout.create(name: workout2.name, users_id: emily.id, workouts_id: workout1.id, total_duration: 10.0, favorites: nil, date: 03-02-2021)
