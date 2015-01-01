Blog.config
  adminRole: 'blogAdmin'
  authorRole: 'blogAuthor'
  
Meteor.startup ->
  admin = Meteor.users.findOne({username: "admin"})
  if admin?
    Meteor.users.update({username: "admin"},{$set:{"roles": ["blogAdmin"]}})
  
