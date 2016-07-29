app = angular.module 'app', ['ngRoute', 'ngAnimate', 'ui.calendar']

app.config ['$locationProvider', '$routeProvider', ($locationProvider, $routeProvider)->

  $routeProvider.when('/', {
    templateUrl: '/templates'
  }).when('/profile',{
    templateUrl: '/templates/profile'
    controller: 'ProfileController'
    controllerAs: 'ctrl'
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

app.controller 'ProfileController', ['$http', ($http)->

  @profile = {}

  $http.get('/profiles').success(
    (data)=>
      @profile = data
  )

  @save = ->
    $http.post('/profiles', {profile: {
      first_name: @profile.first_name
      last_name: @profile.last_name
      email: @profile.email
    }}).success(
      ->
        alert 'Successfully saved'
    ).error(
      (errors)->
        if errors[0]
          alert "ERROR: #{errors[0]}"
    )

  return undefined
]