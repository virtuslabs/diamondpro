import Ember from 'ember';

export default Ember.Route.extend({
  model(params){
    return this.store.find('client', params.client_id);
  }
});
