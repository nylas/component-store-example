ToggleRegionsButton = React.createClass
  getInitialState: ->
    active: ComponentStore.showComponentRegions()

  componentDidMount: ->
    @unlisten = ComponentStore.listen =>
      @setState(active: ComponentStore.showComponentRegions())

  componentWillUnmount: ->
    @unlisten()

  render: ->
    if @state.active
      <div className='btn' onClick={@_toggleShowRegions}>Hide Injected Regions</div>
    else
      <div className='btn' onClick={@_toggleShowRegions}>Show Injected Regions</div>

  _toggleShowRegions: ->
    Actions.toggleShowRegions()


LoadPluginButton = React.createClass
  render: ->
    <div className='btn' onClick={@_onClick}>Load 'Mark As Read' Plugin</div>

  _onClick: ->
    script = document.createElement('script')
    script.setAttribute('type','text/cjsx')
    script.setAttribute('src','http://localhost:9001/src/plugins/test-plugin.cjsx')
    document.head.appendChild(script)

    # Fire DOMContentLoaded to make the in-browser CJSX compilation
    # happen for our new script tag
    loadedEvent = document.createEvent("Event")
    loadedEvent.initEvent("DOMContentLoaded", true, true)
    window.document.dispatchEvent(loadedEvent)


Message = React.createClass
  propTypes:
    item: React.PropTypes.object.isRequired
    selected: React.PropTypes.bool.isRequired

  render: ->
    classes = 'message'
    classes += ' selected' if @props.selected
    classes += ' unread' if @props.item.unread

    <div className={classes} onClick={@_onSelect}>
      <div className='from'>{@props.item.from}</div>
      <div className='subject'>{@props.item.subject}</div>
    </div>

  _onSelect: ->
    Actions.selectMessage(@props.item)



MessageList = React.createClass
  getInitialState: ->
    messages: MessageStore.items(),
    selected: MessageStore.selected()

  componentDidMount: ->
    @unlisten = MessageStore.listen =>
      @setState({
        messages: MessageStore.items(),
        selected: MessageStore.selected()
      })

  componentWillUnmount: ->
    @unlisten()

  render: ->
    <div className='messages'>
      { @state.messages.map (msg) =>
        <Message key={msg.id} item={msg} selected={msg is @state.selected}/>
      }
    </div>


window.RouteWelcome = React.createClass
  contextTypes:
    router: React.PropTypes.func

  render: ->
    <div style={textAlign:'center'}>
      <h2>Messages</h2>

      <InjectedComponentSet
        className='actions'
        matching={role: 'message-action'} />

      <MessageList />

      <hr/>

      <div className='debug'>
        <ToggleRegionsButton />
        <LoadPluginButton />
      </div>
    </div>
