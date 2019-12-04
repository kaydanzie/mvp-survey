Winner.destroy_all
Nomination.destroy_all
Survey.destroy_all
User.destroy_all

#
# Users
# Admin, Remote Employee, GR Employee, 2 MI Employees for easier development
admin = User.create(email: "admin@formulafolios.com", first_name: "Admin", role: "admin")
mich1 = User.create(email: "employee_mi@formulafolios.com", first_name: "MI Employee")
mich2 = User.create(email: "mi2@formulafolios.com", first_name: "MI Employee 2")
User.create(email: "employee_ca@formulafolios.com",
            first_name: "CA Employee", office: "Costa Mesa")
User.create(email: "employee_remote@formulafolios.com",
            first_name: "Remote Employee", office: "Other/Remote")

#
# Surveys
survey = Survey.create(name: "July Survey 2019")
Survey.create(name: "August Survey 2019")

#
# Nominations
# Should be from the same office and can't nominate self
Nomination.create(user_id: admin.id, nominee_id: mich1.id, survey_id: survey.id,
                  comments: "Of the highest kind, quality, or order. Surpassing all else or others")
Nomination.create(user_id: mich1.id, nominee_id: mich2.id, survey_id: survey.id)
Nomination.create(user_id: mich2.id, nominee_id: mich1.id, survey_id: survey.id,
                  comments: "He's alright")
