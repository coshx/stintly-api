# For more information see: http://emberjs.com/guides/routing/

Prioritime.Router.map ->
  @route("index", path: "/")

  @route("playground")

  @route("dashboard")

  @resource "people", path: '/people', ->
    @route('index', path: '/')
    @route('new', path: '/new')
    @route('show', path: '/:slug')
    @route('edit', path: '/:slug/edit')

  @resource "projects", path: '/projects', ->
    @route('index', path: '/')
    @route('new', path: '/new')
    @route('show', path: '/:slug')
    @route('edit', path: '/:slug/edit')

  @resource 'users', ->
    @route('sign_in', path: '/sign_in')
    @route('sign_up', path: '/sign_up')
    @route('sign_out', path: '/sign_out')

  # For future use when we scale up
  # @resource 'companies', path: '/companies/:slug', ->
  #   @route('dashboard', path: '/dashboard')

  #   @resource 'companies.employees', path: 'employees', ->
  #     @route('index', path: '/')
  #     @route('new', path: '/new')
  #     @route('show', path: '/')
  #     @route('edit', path: '/:slug/edit')

Prioritime.Router.reopen
  location: 'history'


