if User.count.zero?
  user = User.create(full_name: 'Super Admin',
                     password: 'P@ssw0rd',
                     email: 'admin@example.com',
                     is_root: true)
end
