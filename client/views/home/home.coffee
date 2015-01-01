Template.home.helpers
  formType: ()->
   Session.get "formType"	

  formHeader:()->
    if Session.equals("formType","login")
      "Sign in"
    else
      "Register"

Template.home.events
  "click .facebook": ()->
    Meteor.loginWithFacebook
          requestPermissions: ["email","user_friends","user_about_me","publish_actions"]
          requestOfflineToken:true
        , (error) ->
          console.log error.reason if error

  "click .twitter": ()->
    Meteor.loginWithTwitter
      requestOfflineToken:true
      , (error) ->
        console.log error.reason if error

  "click .github":()->
    Meteor.loginWithGithub
      requestPermissions:["user","public_repo","repo","notifications"]
      , (error) ->
        console.log error.reason if error
      requestOfflineToken:true

  "click .logout":()->
    Session.set "formType", "login"
    Meteor.logout()

  "click .need-account":()->
    Session.set "formType","registration"

