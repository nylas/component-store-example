{RouteHandler, Route, DefaultRoute} = ReactRouter

routes =
  <Route path="/">
    <DefaultRoute name="welcome" handler={RouteWelcome} />
  </Route>

window.Router = ReactRouter.run routes, (Handler) ->
  React.render(<Handler/>, document.getElementById("application"))
