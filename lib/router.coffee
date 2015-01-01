if Meteor.isClient
  Router.onBeforeAction(()->
    if !Meteor.userId()
      @render("login")
    else
      @next()
  )

