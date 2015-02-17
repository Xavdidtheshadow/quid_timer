var app = angular.module('quidTimer', ['timer'])

  .controller('MainCtrl', ['$scope', function($scope){
    $scope.message = 'hiiiii';
    $scope.init = true;
    $scope.timerRunning = false;
    $scope.add = true;

    $scope.teams = {};
    
    $scope.inputs = {
        
    };

    $scope.createPlayer = function(){

    };

    $scope.createTeam = function(name, t){
        $scope.teams[t] = {
            score: 0,
            name: name,
            box: []
        };
    };

    $scope.adjustScore = function(t) {
        if ($scope.add) {
            $scope.teams[t].score += 10;
        }
        else {
            $scope.teams[t].score -= 10;
        }
    };

    $scope.startTimer = function() {
      if ($scope.init) {
        $scope.$broadcast('timer-start');
        $scope.init = false;
      }
      else {
        $scope.$broadcast('timer-resume');
      }
      $scope.timerRunning = true;  
      // $scope.$digest();
    };

    $scope.stopTimer = function() {
      $scope.$broadcast('timer-stop');
      $scope.timerRunning = false;
      // $scope.$digest();
    };
  }]);