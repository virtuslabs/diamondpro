import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    saveClient: function(client){
      client.save().then(() => this.transitionTo('clients.client', client.id))
    },
    deleteClient: function(client){
      let confirmation = confirm('Are you sure you want to delete this client?');

      if (confirmation) {
        client.destroyRecord().then(() => this.transitionTo('clients'));
      }
    }
  }
});
