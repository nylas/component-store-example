
window.ComponentStore = Reflux.createStore({

  init: function() {
    this.listenTo(Actions.register, this._onRegister);
    this.listenTo(Actions.unregister, this._onUnregister);
    this.listenTo(Actions.toggleShowRegions, this._onToggleRegions);

    this._items = []
    this._showComponentRegions = false;
  },

  findComponentsMatching: function(match) {
    return this._items;
  },

  showComponentRegions: function() {
    return this._showComponentRegions;
  },

  _onToggleRegions: function() {
    this._showComponentRegions = !this._showComponentRegions;
    this.trigger();
  },

  _onRegister: function(component) {
    this._items.push(component);
    this.trigger();
  },

  _onUnregister: function(component) {
    var idx = this._items.indexOf(component);
    if (idx != -1) {
      this._items.splice(idx, 1);
      this.trigger();
    }
  }

});
