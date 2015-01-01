Template.login.events
    "click .facebook": ()->
      Meteor.loginWithFacebook
            requestPermissions: ["email","user_location","user_interests","user_friends","user_about_me","user_online_presence","publish_actions"]
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
        requestPermissions:["user","public_repo","repo","notifications","gist"]
        , (error) ->
          console.log error.reason if error
        requestOfflineToken:true

    "click .logout":()->
      Meteor.logout()

    "submit #login-form":(e)->
      e.preventDefault()
      username = $("#username").val()
      password = $("#password").val()
      Meteor.loginWithPassword(username,password,(error)->
        if error
          console.log error
        else
          alert "Login Successful"
      )
      
  Template.registration.events
    "submit #registration":(e) ->
      e.preventDefault()	
      username = $("#register-name").val()
      password = $("#register-password").val()
      console.log password
      console.log username
      Accounts.createUser({username: username,password: password},(error,response)->
        if error
          console.log error
        else
          alert "Welcome new user"
      )
