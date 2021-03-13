
#### Summary
We made a CLIapp that allows the user to create a workout which gets saved to a gallery of workouts. The use rhas full CRUD abilities over their account information. 

#### Objectives
1. Make 5+ models. We made 5 one-to-many models, 2 many-to-many models, and 1 joiner.
2. Allow user to create a workout.
3. Save the made workout to our databases. 
4. Retrieve the workout. 
5. Give user full CRUD abilities over account details. 

---
### Common Questions:
- How do I turn off my SQL logger?
```ruby
# in config/environment.rb add this line:
ActiveRecord::Base.logger = nil
```
