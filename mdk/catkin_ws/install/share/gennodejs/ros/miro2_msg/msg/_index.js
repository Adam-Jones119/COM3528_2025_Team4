
"use strict";

let sensors_package = require('./sensors_package.js');
let affect_adjust = require('./affect_adjust.js');
let animal_state = require('./animal_state.js');
let sleep = require('./sleep.js');
let priority_peak = require('./priority_peak.js');
let push = require('./push.js');
let object_face = require('./object_face.js');
let object_tag = require('./object_tag.js');
let object_ball = require('./object_ball.js');
let voice_state = require('./voice_state.js');
let BatteryState = require('./BatteryState.js');
let affect = require('./affect.js');
let funnel_web = require('./funnel_web.js');
let sleep_adjust = require('./sleep_adjust.js');
let adjust = require('./adjust.js');
let animal_adjust = require('./animal_adjust.js');
let objects = require('./objects.js');
let img_annotation = require('./img_annotation.js');

module.exports = {
  sensors_package: sensors_package,
  affect_adjust: affect_adjust,
  animal_state: animal_state,
  sleep: sleep,
  priority_peak: priority_peak,
  push: push,
  object_face: object_face,
  object_tag: object_tag,
  object_ball: object_ball,
  voice_state: voice_state,
  BatteryState: BatteryState,
  affect: affect,
  funnel_web: funnel_web,
  sleep_adjust: sleep_adjust,
  adjust: adjust,
  animal_adjust: animal_adjust,
  objects: objects,
  img_annotation: img_annotation,
};
