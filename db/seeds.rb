require 'faker'

# Create Users
user_a = User.create(username: "Luminous", email: "lm@lm.com", password: "lm123", password_confirmation: "lm123")

review_test_user = User.create(username: "CriticalCrit", email: "cr@cr.com", password: "cr123", password_confirmation: "cr123")

# Create Stories
user_a.stories.create(title: "Test Story", summary: "asdf")

# Create Characters
char_a = Character.create(
    user_id: 1,
    story_id: 1,
    name: "Jake",
    overview: 'Average hunter from a small town.',
    age: 20,
    gender: "Male",
    species: "Human",
    personality: "W.I.P."
)

story = Story.first 
review_test_user.comments.create(:commentable => story, content: Faker::Lorem.sentence)

# Create Comments for Characters
review_test_user.comments.create(:commentable => char_a, content: "asdfg")