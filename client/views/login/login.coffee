Template.login.events
  "submit #login-form":(e)->
    e.preventDefault()
    username = $("#username").val()
    password = $("#password").val()
    Meteor.loginWithPassword(username,password,(error)->
      if error
        console.log error
    )
    
