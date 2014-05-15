(function() {
  'use strict';

  angular.module('directives.in-place', [])
  .directive('inPlace', function() {
    function link(scope, element, attrs) {
      
    }
    
    return {
      controller: function($scope) {
        var self = this;
        var editor = null;
        var viewer = null;
        var initialValue = null;
        
        this.edit = function() {
          viewer.hide();
          editor.show();
        };
        
        this.view = function() {
          viewer.show();
          editor.hide();
        }
        
        this.setEditor = function(value, elem) {
          editor = elem;
          
          initialValue = value;
          
          if (initialValue === '')
            self.edit();
        }
        
        this.setViewer = function(elem) {
          viewer = elem;
          
          if (initialValue === '')
            viewer.hide();
        }
      },
      link: link
    };
  })
  .directive('inPlaceView', function() {    
    function link(scope, element, attrs, ctrl) {
      element.toggleClass('hidden', false);
      
      ctrl.setViewer({
        show: function() {
          element.toggleClass('hidden', false);
        },
        hide: function() {
          element.toggleClass('hidden', true);
        }
      });
      
      element.on('click', function() {
        ctrl.edit();
      });
    }
    
    return {
      require: '^inPlace',
      link: link
    }
    
  })
  .directive('inPlaceEdit', function() {

    function controller($scope, $parse, $attrs) {
      $scope.getEditValue = function() {
        return $parse($attrs.ngModel)($scope)
      }
    }

    function link(scope, element, attrs, ctrl) {
      element.toggleClass('hidden', true);
      
      element.on('blur', function() {
        if (element.val() !== '')
          ctrl.view();
      });
            
      ctrl.setEditor(scope.getEditValue(), {
        show: function() {
          element.toggleClass('hidden', false);
          element[0].focus();
          var value = element.val();
          element.val('').val(value);
        },
        hide: function() {
          element.toggleClass('hidden', true);
        }
      });
    }
    
    return {
      require: '^inPlace',
      controller: controller,
      link: link
    }
    
  });
  // .directive('inPlaceFocus', function() {
  // 
  //   function link(scope, element, attrs, ctrl) {
  //     
  //     element.on('blur', function() {
  //       scope.blur();
  //     });
  //     
  //     ctrl.setFocus({
  //       focus: function() {
  //         element[0].focus();
  //         var value = element.val();
  //         element.val('').val(value);
  //       }
  //     });
  //   }
  //   
  //   return {
  //     require: '^inPlaceEdit',
  //     link: link
  //   }
  //   
  // });

}());
