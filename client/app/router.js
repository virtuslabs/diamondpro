import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('clients', function() {
    this.route('client', {'path': '/:client_id'}, function() {
      this.route('edit');
    });
    this.route('new');
    // this.route('edit', {'path': '/:client_id/edit'});
  });
  this.route('appointments');
  this.route('packages', function() {
    this.route('new');
    // this.route('edit', {'path': '/:client_id/edit'});
    this.route('package', {'path': '/:package_id'}, function() {
      this.route('edit');
    });
  });
});

export default Router;
