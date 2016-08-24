import Ember from 'ember';

export default Ember.Route.extend({

  model(params){
    alert(params.package_id);
    return this.store.find('package', params.package_id);
  }
});
