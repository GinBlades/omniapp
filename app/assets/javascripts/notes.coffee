angular.module "Notes", []
  .controller "NotesListCtrl", ["$scope", ($scope) ->
    $scope.test = "This is a test"
  ]
