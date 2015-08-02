angular.module "Fallout", []
  .controller "FalloutComputerCtrl", ["$scope", ($scope) ->
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
