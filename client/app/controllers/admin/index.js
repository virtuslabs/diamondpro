import Ember from 'ember';

const {inject} = Ember;

export default Ember.Controller.extend({
  needs: ['application'],
  session: inject.service('session'),
  controller: Ember.inject.controller('application'),
  Admin: Ember.computed(function(){
    return this.get('controller.isAdmin');
  })
});
