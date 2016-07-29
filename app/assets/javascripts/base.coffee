app = angular.module 'app', ['ngRoute', 'ngAnimate', 'ui.calendar']

app.config ['$locationProvider', '$routeProvider', ($locationProvider, $routeProvider)->

  $routeProvider.when('/', {
    templateUrl: '/templates'
  }).when('/profile',{
    templateUrl: '/templates/profile'
  }).when('/calendar', {
    templateUrl: '/templates/calendar'
  }).otherwise({
    templateUrl: '/templates/not_found'
  })

  $locationProvider.html5Mode(true)

]

app.run ['$rootScope', ($rootScope)->
  $rootScope.$on '$routeChangeStart', (event, next, current)=>
    if next.$$route.originalPath == '/'
      $rootScope.currentLink = 'Home'
    else if next.$$route.originalPath == '/profile'
      $rootScope.currentLink = 'Profile'
    else if next.$$route.originalPath == '/calendar'
      $rootScope.currentLink = 'Calendar'
    else
      $rootScope.currentLink = null
]

app.controller 'SideBarController', ['$rootScope', ($rootScope)->

  $rootScope.$on '$routeChangeStart', ()=>
    @currentLink = $rootScope.currentLink

  return undefined
]

app.controller 'TopBarController', ['$rootScope', ($rootScope)->

  $rootScope.$on '$routeChangeStart', ()=>
    @currentLink = $rootScope.currentLink || ''

  return undefined
]