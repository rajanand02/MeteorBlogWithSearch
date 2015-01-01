Session.setDefault "formType", "login_form"
Template.login.helpers
  formType: ()->
   Session.get "formType"	

  formHeader:()->
    type = Session.get "formType"
    if type is "login_form"
      "Sign in"
    else
      "Register"

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
      Session.set "formType", "login_form"
      Meteor.logout()

    "click .need-account":()->
      Session.set "formType","registration_form"
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
      
  Template.registration_form.events
    "submit #registration":(e) ->
      e.preventDefault()	
      username = $("#register-name").val()
      password = $("#register-password").val()
      password2 = $("#confirm-password").val()
      if password isnt password2
        alert("Password not matching")
      else
        if password is "" or username is ""
          alert "Username/Password cannot be empty"
        else
          if password.length < 6
            alert "Password is too small. It should be atleast of 6 characters"
          else
            Accounts.createUser({username: username,password: password},(error,response)->
              if error
                console.log error
            )

    "click .member":()->
      Session.set "formType", "login_form"
