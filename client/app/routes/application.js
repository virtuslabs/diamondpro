import Ember from 'ember';
import ApplicationRouteMixin from 'ember-simple-auth/mixins/application-route-mixin';

export default Ember.Route.extend(ApplicationRouteMixin, {
  isAdmin: 'true',
  actions: {
    login () {
      var lockOptions = {
        auth: {
          params: {scope: 'openid email user_metadata'} //Details: https:///scopes
        },
        additionalSignUpFields: [{
          name: "last_name",
          placeholder: "last_name"
        },
        {
          name: "first_name",
          placeholder: "first_name"
        }]
      };
      this.get('session').authenticate('simple-auth-authenticator:lock', lockOptions);
    },

    logout () {
      this.get('session').invalidate();
    }
  }
});
