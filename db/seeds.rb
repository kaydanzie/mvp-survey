User.destroy_all

User::ROLES.each do |role|
  User.find_or_create_by(email: "#{role.delete(" ")}@formulafolios.com")
      .update(first_name: role.titleize, role: role)
end
