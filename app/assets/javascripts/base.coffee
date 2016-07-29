app = angular.module 'app', ['ngRoute', 'ngAnimate']

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

app.controller 'SideBarController', ['$rootScope', ($rootScope)->

  @currentLink = null

  $rootScope.$on '$routeChangeStart', (event, next, current)=>
    if next.$$route.originalPath == '/'
      @currentLink = 'home'
    else if next.$$route.originalPath == '/profile'
      @currentLink = 'profile'
    else if next.$$route.originalPath == '/calendar'
      @currentLink = 'calendar'
    else
      @currentLink = null

  return undefined
]