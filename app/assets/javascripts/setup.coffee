window.App = Ember.Application.create()

App.Store = DS.Store.extend
	revision: 11

DS.RESTAdapter.reopen
  namespace: 'api'
