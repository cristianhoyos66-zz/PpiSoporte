 slide.directive('chat', function ($firebase) {
          return {
            restrict: 'E',
            templateUrl: 'assets/chat/chat.html' ,
            controller: function ($scope) {
                var ref = new Firebase('https://ppisoporte.firebaseio.com/');
                $scope.messages = $firebase(ref.limit(6));
                $scope.username = 'Invitado ' + Math.floor(Math.random()*101);
                $scope.addMessage = function() {
                  $scope.messages.$add({
                    from: $scope.username, content: $scope.message
                  });
                  $scope.message = "";
                }
            }
          }
        });
