rules_of_login = [
  "required,user[email], 请输入邮件地址",
  "required,user[password], 请输入密码",
  "valid_email,user[email], 请输入有效格式的邮件地址"
]

rules_of_register = [
  "required,user[email], 请输入邮件地址",
  "required,user[login], 请输入昵称",
  "required,user[password], 请输入密码",
  "required,user[password_confirmation], 请再次输入密码",
  "valid_email,user[email], 请输入有效格式的邮件地址",
  "same_as,user[password],user[password_confirmation], 两次密码需要一致",
  "length>=6,user[password], 密码不能小于6位",
  "length>=6,user[password_confirmation], 密码不能小于6位."
]

