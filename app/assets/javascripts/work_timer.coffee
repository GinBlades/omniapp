angular.module "WorkTimer", []
  .controller "WorkTimerCtrl", ["$scope", "$interval", ($scope, $interval) ->
    thirtyMinutes = 60 * 30 * 1000
    timeRemaining = 0
    oneSecond = 1000
    $scope.time = thirtyMinutes
    stop = $interval ->
      console.log($scope.time)
      $scope.time = thirtyMinutes - timeRemaining
      timeRemaining += oneSecond
    , oneSecond

    $scope.reset = () ->
      $scope.time = thirtyMinutes
      timeRemaining = 0
  ]
  .filter "timeFilter", () ->
    (input) ->
      totalSeconds = input / 1000
      minutes = Math.floor(totalSeconds / 60)
      seconds = totalSeconds % 60
      displaySeconds = if "#{seconds}".length < 2 then "0#{seconds}" else seconds
      "#{minutes}:#{displaySeconds}"
