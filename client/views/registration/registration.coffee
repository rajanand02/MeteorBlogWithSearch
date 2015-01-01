Template.registration.events
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
    Session.set "formType", "login"


