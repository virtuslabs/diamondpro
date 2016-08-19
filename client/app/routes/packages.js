import Ember from 'ember';

export default Ember.Route.extend({
  queryParams: {
  package_type: {
      refreshModel: true
    }
  },
  model(params){
    // console.log('Params: ', params);
    return this.store.query('package', params);
  }
});
