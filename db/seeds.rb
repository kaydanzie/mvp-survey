Survey.destroy_all
User.destroy_all

# Users #
# Admin, Remote Employee, GR Employee, MI Employee
User.find_or_create_by(email: "admin@formulafolios.com")
    .update(first_name: "Admin", role: "admin")
User.find_or_create_by(email: "employee_ca@formulafolios.com")
    .update(first_name: "CA Employee", role: "employee", office: "Costa Mesa")
User.find_or_create_by(email: "employee_mi@formulafolios.com")
    .update(first_name: "MI Employee", role: "employee", office: "Grand Rapids")
User.find_or_create_by(email: "employee_remote@formulafolios.com")
    .update(first_name: "Remote", last_name: "Employee", role: "employee", office: "Other/Remote")
