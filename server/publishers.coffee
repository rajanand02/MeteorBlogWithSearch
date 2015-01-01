#Meteor.publish("posts",()->
  #if @userId?
    #Post.find()
  #else
    #false
#)
