// Set up mouse events for drawing
var drawing = false;
var mousePos = { x:0, y:0 };
var lastPos = mousePos;
canvas.addEventListener("mousedown", function (e) {
        drawing = true;
  lastPos = getMousePos(canvas, e);
}, false);
canvas.addEventListener("mouseup", function (e) {
  drawing = false;
}, false);
canvas.addEventListener("mousemove", function (e) {
  mousePos = getMousePos(canvas, e);
}, false);

// Get the position of the mouse relative to the canvas
function getMousePos(canvasDom, e) {
  var canvas = canvasDom.getBoundingClientRect();
  return {
    x: e.clientX - canvas.left,
    y: e.clientY - canvas.top
  };
}










// Set up touch events for mobile, etc
canvas.addEventListener("touchstart", function (e) {
        mousePos = getTouchPos(canvas, e);
  var touch = e.touches[0];
  var mouseEvent = new MouseEvent("mousedown", {
    clientX: touch.clientX,
    clientY: touch.clientY
  });
  canvas.dispatchEvent(mouseEvent);
}, false);
canvas.addEventListener("touchend", function (e) {
  var mouseEvent = new MouseEvent("mouseup", {});
  canvas.dispatchEvent(mouseEvent);
}, false);
canvas.addEventListener("touchmove", function (e) {
  var touch = e.touches[0];
  var mouseEvent = new MouseEvent("mousemove", {
    clientX: touch.clientX,
    clientY: touch.clientY
  });
  canvas.dispatchEvent(mouseEvent);
}, false);

// Get the position of a touch relative to the canvas
function getTouchPos(canvasDom, e) {
  var canvas = canvasDom.getBoundingClientRect();
  return {
    x: e.touches[0].clientX - canvas.left,
    y: e.touches[0].clientY - canvas.top
  };
}