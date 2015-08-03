angular.module "Games", []
  .controller "FalloutComputerCtrl", ["$scope", ($scope) ->
    $scope.invalid = (formField) ->
      passcodeForm.guess.$invalid && passcodeForm.guess.$dirty
    $scope.valid = (formField) ->
      passcodeForm.guess.$valid && passcodeForm.guess.$dirty
    $scope.remainingOptions = ->
      remainingPasscodes = $scope.passcode.options.split(" ")
      possiblePasscodes = []
      passcodeLetters = $scope.passcode.guess.split("")
      correctNumber = parseInt($scope.passcode.correct)

      remainingPasscodes.forEach (code) ->
        correctLetters = 0
        if code == $scope.passcode.guess
          return

        passcodeLetters.forEach (letter, index) ->
          if correctLetters > correctNumber
            return
          if code[index] == letter
            correctLetters++

        if correctNumber == correctLetters
          possiblePasscodes.push(code)

      $scope.passcode.options = possiblePasscodes.join(" ")
  ]
  .directive "setValidationClass", ->
    {
      restrict: "A"
      scope:
        formField: "="
      link: (scope, el, attrs) ->
        el.find("[name]").on "blur", ->
          if scope.formField.$invalid && scope.formField.$dirty
            console.log "error"
            el.addClass("has-error")
          if scope.formField.$valid && scope.formField.$dirty
            console.log "success"
            el.addClass("has-success")
    }
