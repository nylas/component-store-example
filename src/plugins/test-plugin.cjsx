
MarkAsReadComponent = React.createClass
  displayName: 'MarkAsReadComponent'

  getInitialState: ->
    selected: MessageStore.selected()

  componentDidMount: ->
    @unlisten = MessageStore.listen =>
      @setState({selected: MessageStore.selected()})

  componentWillUnmount: ->
    @unlisten()

  render: ->
    # Try throwing an exception in here for fun!
    # @doesNotExist()

    classname = 'btn'
    classname += ' disabled' unless @state.selected?.unread

    <div className={classname} onClick={@_onClick}>
      Mark as Read
    </div>

  _onClick: ->
    return unless @state.selected
    msg = _.extend({}, @state.selected)
    msg.unread = false
    Actions.persistData(msg)


Actions.register(MarkAsReadComponent, {role: 'message-action'})
