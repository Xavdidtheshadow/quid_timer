var app = angular.module('quidTimer', ['timer'])

  .controller('MainCtrl', ['$scope', function($scope){
    $scope.message = 'hiiiii';
    $scope.init = true;
    $scope.timerRunning = false;

    // $scope.startTimer = function() {
    //   if ($scope.init) {
    //     $scope.$broadcast('timer-start');
    //     $scope.init = false;
    //   }
    //   else {
    //     $scope.$broadcast('timer-resume');
    //   }
    //   $scope.timerRunning = true;  
    // };

    // $scope.stopTimer = function() {
    //   $scope.$broadcast('timer-stop');
    //   $scope.timerRunning = false;
    // };
  }]);