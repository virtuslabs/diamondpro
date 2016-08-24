import Ember from 'ember';

const {inject} = Ember;

export default Ember.Controller.extend({
  session: inject.service('session'),
  isAdmin: Ember.computed(function(){
    return this.get('session').session.content.authenticated.profile.roles[0] == 'admin' ? true: false;
  })
});
