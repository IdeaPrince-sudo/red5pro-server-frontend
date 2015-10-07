/*global window, document*/
(function(window, document) {
  'use strict';

  var path = window.namespace('com.infrared5.examples.basic');
  var bridge = path.EventBridge;
  var buttonFactory = path.UIButtonFactory;

  var secondscreenClient = window.secondscreenClient.noConflict();
  secondscreenClient.log.info(secondscreenClient.versionStr());

  var options = document.getElementById('options');
  var panel = document.getElementById('log-panel');
  var appendMessage = function(value) {
    var p = document.createElement('p'),
        text = document.createTextNode(value);
    p.appendChild(text);
    panel.appendChild(p);
  };
  var addButton = function(config) {
  // id, name, upClass, downClass, eventName
    var button = buttonFactory.create().init(config);
    options.appendChild(button.$view);
    button.render().activate();
  };

  var app = {
    init: function(secondscreenClient) {
      this.secondscreenClient = secondscreenClient;

      addButton({
        id: 'push-button',
        name: '',
        eventName: 'push',
        upClass: 'push-button-state-up',
        downClass: 'push-button-state-down'
      });

      bridge.on('push', function(event) {
        secondscreenClient.send('push', {
          id: event.data.id
        }, 'foo');
      });

      secondscreenClient.on('test', function(data) {
        appendMessage('received test: ' + data + '.');
      });

      secondscreenClient.on('testing', function(data) {
        appendMessage('received testing: ' + data + '.');
      });

      secondscreenClient.on('state', function(data) {
        appendMessage('state: ' + data);
      });

      return this;
    }
  };

  path.app = app.init(secondscreenClient);

}(window, document));