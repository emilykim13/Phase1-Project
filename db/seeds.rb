# In this file you can create your initial instances of your classes
# User.destroy_all
# emily = User.create(user_name: "emilykim13", password: "ilikememes", first_name: "emily", last_name: "nguyen", weight: 128, height: 67.0, gender: "female", BMI: 20.0, birth_year: 1997)

Arm.destroy_all
Ab.destroy_all
Leg.destroy_all
Back.destroy_all
Shoulder.destroy_all
# User.destroy_all
UserWorker.destroy_all
Workout.destroy_all

barbell_bicep_curl = Arm.create(name: "Barbell Bicep Curl", intensity: "low", duration: 1.0)
russian_twists = Ab.create(name: "Russian Twists", intensity: "high", duration: 1.0)
lunges = Leg.create(name: "lunges", intensity: "low", duration: 1.0)
deadlifts = Back.create(name: "Deadlifts", intensity: "high", duration: 1.0)
pullups = Shoulder.create(name: "Pull-ups", intensity: "high", duration: 1.0)



    #user
#       t.string :user_name
#       t.string :password
#       t.string :first_name
#       t.string :last_name
#       t.integer :weight  --> lbs
#       t.float :height --> inches? or cm?
#       t.string :gender
#       t.integer :BMI  --> how to put a percent
#       t.integer :birth_year  --> how to set up an age system?
    #ab
# create_table "abs", force: :cascade do |t|
#     t.string "name"
#     t.string "intensity"
#     t.integer "duration"