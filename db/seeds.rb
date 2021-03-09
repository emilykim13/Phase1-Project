# In this file you can create your initial instances of your classes
User.destroy_all
emily = User.create(user_name: "emilykim13", password: "ilikememes", first_name: "emily", last_name: "nguyen", weight: 128, height: 67.0, gender: "female", BMI: 20.0, birth_year: 1997)




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