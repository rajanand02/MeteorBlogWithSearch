if Meteor.isClient
  Router.configure
    notFoundTemplate: 'not_found'
    loadingTemplate: 'loading'
  Router.onBeforeAction(()->
    if !Meteor.userId()
      @render("home")
    else
      @next()
  )

